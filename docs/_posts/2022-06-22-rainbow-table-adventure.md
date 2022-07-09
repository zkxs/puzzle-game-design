---
layout: post
title: "Rainbow Table Adventure"
date: 2022-06-22 14:39:42 -0500
modified_date: 2022-07-09 15:04:25 -0500
tags: [security, neos]
author: Michael Ripley
---

This is a story about an adventure I took into video game reverse engineering, Discord user IDs, and rainbow tables. If you don't know what a rainbow table is, don't worry. All the technical terminology in this post will be explained as we go, and I'll include Wikipedia links in case you want more detail than my brief definitions.

## The Adventure Begins

While talking to some folks in Neos one day back in May 2021, someone mentions that there are some hidden fields in the User component. These fields can't normally be seen in game, but you can still read them using a technique called refhacking.

**Refhacking** is an unintended side effect of a couple different Neos features. In short, it allows you to create a reference to something dynamically. This is a big deal, as normally in Neos each reference has to be created by hand and there's no dynamic way of getting a field from an arbitrary component. The downside? Refhacking is really more of a bug than a feature, and it's horribly horribly inefficient.

Back to the story: using refhacking we're able to read these hidden fields from the User component, and we find that there's a Steam ID and a Discord user ID in there. The Steam ID isn't very exciting, because pretty much any multiplayer game that uses Steam networking exposes your Steam ID to other players. The Discord user ID, however, is unexpected. While Discord user IDs aren't a secret on their own, it's surprising that nearly every Neos user is broadcasting it to each session they join. If Discord is running when you launch Neos, then Neos will put your Discord ID into your User component. This ID is then readable by anyone in a session with you.

Bored Neos players love a fun project, so naturally we set out to make a proof-of-concept that lets you pick a User and automatically refhack to get their Discord ID. A Discord gun, if you will. One issue is that a Discord ID looks like `177811898790807200`, which isn't incredibly useful to a human. However, using Discord's bot API we can translate that back to the username + discriminator (e.g. `runtime #1234`) that everyone knows and loves. After an evening of work figuring out the refhacking and Discord API, the implementation is done. I can now shoot my Discord gun at an arbitrary user and it'll show me their Discord username. Very useful for both adding friends and blowing minds!

At this point things are relatively simple, but that won't last for long.

## The Game has Changed

For about 10 days after the initial implementation nothing particularly interesting happens, aside from learning that we're not the first people to do this. There's another Discord gun already floating around, and I have no idea how long it's existed. However, demoing our tool has raised interest in it again. At some point in those 10 days someone gets spooked by this other Discord gun and raises a moderation report. While Discord user IDs aren't really a huge privacy concern on their own, there's a valid concern that some people might not want a link between their Neos identity and their Discord identity. On May 13, 2021 Frooxius (Neos's main developer) releases Neos build 2021.5.13.384, which changes how these extra user IDs are stored in the User component.

Previously, we would read some data that looked like this:

```json
{
    "UniqueDeviceIdentifier": "041D300FE4E12E001165459DFB6ECF74593906FB30B6E6D014992A3EE8741288",
    "Steam": "76561108048877597",
    "Discord": "177811898790807200"
}
```

This is just the Steam and Discord ID verbatim. UniqueDeviceIdentifier is some internal Neos stuff that's not incredibly interesting.

But after the update, we're getting this gibberish back:

```json
{
    "2752D89C88F1B3689A6BDA82917570E5F7AB6303D15A4A19F05CE4D31A9506C6": "E6537ADDFBA71B98BCF496853F8AAD4F994450D7B994E737B8EE4D52A14F81FC",
    "98750D586F1C412FDA7859E83F19DE802537CB92AD741C720D6AA38F61329278": "7877C7FD4477E8A4050E94E54EE2A3A40A77C1C71818E57ED963F3457EAEE1CD",
    "64A8ED529D50BF94F38F81A48284C5B1981752F4E7956529947C93EE470C8DF0": "4CC69D42030D493363E04BE76050B7067E1ABBE1DB0419F18875360A99B31222"
}
```

What's going on here? The fact that we've got 32 bytes worth of hexadecimal implies that there's some sort of hashing going on… but to learn more we'll have to do some reverse engineering. After some poking around to figure out what Neos is doing internally, I find that there's two things going on here:

1. Each ID's key and value is being locally hashed using [SHA256](https://en.wikipedia.org/w/index.php?title=SHA-256) before being sent to the session host.
2. These hashes are then encrypted using [DES](https://en.wikipedia.org/wiki/Data_Encryption_Standard) before being stored in the User component.

So if we want to read these values, we need to first decrypt the value, then reverse the hash. But before we go deeper into that, I need to explain what encryption and hashing are:

**Encryption** is a process of encoding information such that some secret key is needed to decode the information. DES is a[ symmetric-key algorithm](https://en.wikipedia.org/wiki/Symmetric-key_algorithm), meaning the same secret key is used for both encrypting and decrypting. 

**Hashing** is a process of mapping some input data to a fixed-size output. SHA-256 is a cryptographic hash function, meaning it's specifically designed to be a secure, one-way function. While brute-forcing the input to some hash is possible, it's computationally expensive to the point of infeasibility.

While DES is pretty old and has some security concerns, we don't actually need to break it! Neos helpfully sends everyone in the session the decryption key! Each world contains a `Obfuscation_KEY` and `Obfuscation_IV` value. If we have both of these, we can perform the DES decryption. One problem though: we can't read these values in-game, even using refhacking. The values do exist on my client in-memory though… it's just a question of how to read them. The best option is creating a Neos plugin, which is some custom code that interfaces with Neos at a low level.

The larger problem is the hash. How do we reverse a one-way operation? If we can't solve that problem, then those Discord user IDs are safe and this project is dead… but this post isn't over yet.

## Reversing a Hash

Hashes are expensive to brute force. But *how* expensive? Well, to answer that we have to look at what a Discord ID is. Discord uses a format called [snowflake](https://discord.com/developers/docs/reference#snowflakes) for all of their internal IDs. These snowflake IDs are 64 bit numbers. There are 18,446,744,073,709,551,616 possible values for a 64 bit number. That's *a lot*. Imagine we have some imaginary computer, which we'll name the HashSmasher, that can compute one million SHA-256 hashes per second. It would take the HashSmasher 585 years to brute force the entire space of possible IDs. That's obviously not viable.

Can we do better? As it turns out, 42 bits of the ID are a timestamp, and we only need to account for time values between Discord's initial release in 2015 and the present time. There are approximately 237,000,000,000 different timestamps in that range, which combined with the remaining 22 bits in the ID gets us down to 994,050,048,000,000,000 possible IDs. With this new, much smaller ID space it would only take the HashSmasher 32 years to brute force a hash! While this is much faster, it's still a terribly long time. A naïve brute-force over all possible IDs simply isn't viable.

Can we do even better? In practice, there isn't a new Discord user being created every microsecond. What if we could somehow build a dictionary of all *valid* Discord user IDs? Or even better, a dictionary of all Discord user IDs belonging to Neos players? Well, Neos has a [Discord sever][Neos Discord] that the vast majority of Neos players are a member of. If we could enumerate user IDs from that server, that'd be a wonderful source of data to use in a [dictionary attack](https://en.wikipedia.org/wiki/Dictionary_attack). If we could get down to a dictionary of 10,000 IDs, that would only take the HashSmasher 10 microseconds to brute force a hash! Now we're getting into the realm where an attack is feasible. A typical CPU can easily hash those 10,000 IDs in about 100 milliseconds.

Finally, we can go one step further. Instead of brute-forcing every single hash we encounter against our dictionary, we can pre-compute the hashes and store them a table, like so:

| Input | SHA-256 Hash                                                       |
| ----- | ------------------------------------------------------------------ |
| foo   | `2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae` |
| bar   | `fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9` |
| baz   | `baa5a0964d3320fbc0c6a922140453c8513ea24ab8fd0577034804a967248096` |

Now if we get a hash such as `fcde2b2edba56bf408601fb721fe9b5c338d10ee429ea04fae5511b68fbf8fb9`, we just have to do a quick search of our table and we learn that the input data was `bar`. This technique of pre-computing a reverse-lookup-table for a hash function is called a [rainbow table](https://en.wikipedia.org/wiki/Rainbow_table). Computing the hashes once and saving the result for later is much cheaper than performing a brute-force against our entire dictionary for each hash we want to reverse.

## Discord Shenanigans

Now that we've established that a rainbow-table attack is viable, we need to actually build our dictionary of Discord IDs. Discord doesn't make enumerating users in a server easy to do. A bot is the logical way to automate something like this, but I can't add a bot to a server I don't own. One potential option is a so-called "selfbot", which is a bot that uses the normal user API instead of using Discord's special bot API. However, selfbots are against the Discord ToS and will get you banned. My approach is to simply log in to the Neos Discord server from a browser and use the developer tools to log the data sent to my client. Discord provides [documentation and a decoding example](https://discord.com/developers/docs/topics/gateway#encoding-and-compression) for their websocket data format. So the process is as follows:

1. Open Discord in your browser, and use the dev tools to log websocket data
2. Scroll through the entire user list in the Neos Discord, causing Discord to send you data about each user
3. Export the received websocket data to a file
4. Decompress the websocket data stream into a series of JSON objects
5. Parse each JSON object to extract user IDs
6. Add new user IDs to a lookup table and pre-compute their SHA-256 hash

## Putting it all Together

On May 15, 2021 after another evening of coding, I build my rainbow table, buid a Neos plugin to perform the DES decryption, and update my in-game tool to use my new code. Refhacking is no longer needed, and everything works!

To this day I still haven't released the tool, as it requires a rather poorly put together Neos plugin in order to work. My code isn't in a state where I'm happy enough with it to share. Also, given the previous incident where Discord IDs were allegedly used to scare people, I'm not particularly motivated to polish my software into a release-ready state. So for now, at least, I'm the only person doing this (as far as I know).

For about two months following my rainbow-table implementation, I'm on the fence about whether this is a big enough deal to raise a moderation report over. Eventually after an in-game conversation with another Neos player, I'm convinced that it's worth formally reporting, and the Neos staff can then decide if it's something worth looking into. On July 7, 2021 I open my report and overnight Frooxius adds a [salt](https://en.wikipedia.org/wiki/Salt_(cryptography)) to the SHA-256 hash. This is released in Neos build 2021.7.7.1419.

**Salting** is when some extra randomized data is concatenated with the input of a hashing function. Salting is purpose-built for defeating rainbow-table attacks. As the random salt is unknown ahead of time, an attacker can't precompute a lookup table.

This sounds like it's the end of my rainbow table adventure… however, this post *still* isn't over.

## Salt Problems

The first issue with salting is it only prevents precomputed attacks. A normal dictionary-based brute-force would still be viable. As of this writing, I currently have 11,637 Discord user IDs in my table, and it takes ~95ms to SHA-256 hash all of them. While that's significantly slower than a simple table lookup, it's still not bad.

However, there's a larger issue: Neos isn't using a random salt. It's using a single, hardcoded salt: `599f0e72-c606-483b-8ddd-44e8b5a27515`. So for a Discord ID of `177811898790807200`, the input to the hash is simply salt+id, or `599f0e72-c606-483b-8ddd-44e8b5a27515177811898790807200`. Because the salt is known ahead of time, I can simply regenerate my rainbow table while taking the salt into account. A quick update to my rainbow table generation code and I'm back in business. I add my findings to my moderation report, and I'm then informed that:

> The hardcoded salt is intentional, the goal was only to prevent any potential use of a large public pre-generated rainbow table of Discord ID's. The attacker would need to generate a rainbow table specifically to target Neos.

…which is exactly what I'm doing.

## Epilogue

As of this writing, my tool still works (provided I've managed to scrape your Discord ID at some point).

While I agree with Neos staff that this isn't a huge privacy concern, if it troubles you then you can express your concern on the [Neos Discord Server][Neos Discord] or via a [moderation report](https://moderation.neos.com/), which has an option to report anonymously.

Neos has plans to eventually allow users to opt-out of Discord rich-presence, which will remove this data from the session. Until then, if you don't want your Discord ID potentially leaked to other Neos users, you have a couple workarounds:

- Don't start Neos when Discord is running
- Use [a mod](https://github.com/Psychpsyo/PrivacyPlus) to strip Discord and Steam IDs out of your session join requests

## Timeline

| Timestamp | Event |
| --------- | ----- |
| <span style="white-space:nowrap;">2021-05-03 03:59 UTC</span> | My initial refhacking implementation of the Discord ID finder is completed. |
| <span style="white-space:nowrap;">2021-05-13 06:33 UTC</span> | Frooxius releases the [initial fix, using encryption and hashing](https://discord.com/channels/402159838827905024/469131434628612116/842288417966260234) |
| <span style="white-space:nowrap;">2021-05-15 22:24 UTC</span> | My plugin implementation of the Discord ID finder is completed. |
| <span style="white-space:nowrap;">2021-07-07 20:16 UTC</span> | I open a moderation report about the rainbow table issue. |
| <span style="white-space:nowrap;">2021-07-07 20:53 UTC</span> | The moderation report is acknowledged by Neos staff, noting that this isn't a huge privacy issue but they'll see what they can do. |
| <span style="white-space:nowrap;">2021-07-07 23:41 UTC</span> | Frooxius releases and announces a [salting-based fix](https://discord.com/channels/402159838827905024/469131434628612116/862478398009245696) to mitigate rainbow-table based attacks. |
| <span style="white-space:nowrap;">2021-07-08 01:22 UTC</span> | The moderation report is marked as resolved. |
| <span style="white-space:nowrap;">2021-07-09 01:01 UTC</span> | I follow up my report regarding the issue with the hardcoded salt and an inconsistency with how the host's IDs are handled. |
| <span style="white-space:nowrap;">2021-07-09 12:58 UTC</span> | The new information is acknowledged, and Neos staff will deal with the host IDs. However, the hardcoded salt is intentional and as far as they're going to go with the obfuscation. |
| <span style="white-space:nowrap;">2021-07-09 19:55 UTC</span> | Frooxius releases and announces a [fix for the host ID inconsistency](https://discord.com/channels/402159838827905024/469131434628612116/863146309095260181). |


<!-- reference-style links -->
[Neos Discord]: https://discord.com/invite/NeosVR
