---
layout: post
title: "DRAFT: Client IDs"
date: 2023-02-25 02:44:43 -0600
tags: [security]
author: zkxs
---

It's time for a short story from Space Station 13, a very niche game I've played quite a bit:

> There have been (confirmed) reports of spoofed servers on the byond hub pretending to be other servers.
> 
> If you connect to one of these servers, they will log your ckey and anti-ban-evasion cid, then use that cid when griefing servers so the server admins think its you on an alt account.
> 
> If you use the byond hub as your normal means to connect to servers you use regularly, please stop. its useful for finding a server but you should just use the banner buttons on the website for whatever server you want to connect to once you have a regular server.
> 
> There is no way to moderate what servers can be on the byond hub without gatekeeping who can be allowed to fork which goes against every reason i have for loving open source.

*Source is [this message](https://discord.com/channels/326822144233439242/429431032228610058/1076261164390031530) from the [/tg/Station 13 Official™ Discord](https://discord.com/invite/VW9ZEwc).*

So, what's going on here?

1. The game operates on a client/server model. Servers are community-hosted.
2. The client has a hardware id ("cid" in the above quote). Some malicious users with modded clients can spoof their hardware ID, but most users don't.
3. Servers receive the hardware id verbatim from clients. Servers typically aren't malicious, but some are.
4. There's a central listing of servers (the "byond hub" in the above quote), and malicious servers can exist in that list with a fake name and a fake playercount
5. This allows malicious actors to record the hardware ID of a non-malicious user, and then use it later when they do nefarious acts.

## The Problem

Why is this a problem? Well, spoofed hardware IDs aren't new, so if the hardware ID doesn't match it may be due to spoofing. In other words, a **false negative**. However, now that malicious actors have begun spoofing *stolen* hardware IDs, sometimes a hardware ID will wrongly match when it shouldn't. In other words, a **false positive**. When there were only false negatives, hardware ID was a useful tool to server administrators. If two users had matching hardware IDs, they're the same person, end of story. However with both false negatives *and* false positives in the mix, hardware IDs can't be trusted either way and they lose a lot of value.

Who takes the hit here? If a player manages to get their hardware ID stolen do they deserve to eat a ban when someone spoofs it? Or should server administrators just admin that hardware ID is now useless and stop using it? Have the script kiddies won? If only there were some way we could solve this with technology…

Lets lay out the problem more formally:

1. Clients are not guaranteed to be trustworthy
2. Servers are not guaranteed to be trustworthy
3. An unmodified client should send some form of hardware ID to the server
4. A constant hardware ID is insufficient, as it can be stolen by a malicious server and reused

## The Good Solution: Client Certificates

The client simply derives a public/private key from their hardware ID like so:

1. Gather hardware information
2. Hash hardware information
3. Pass hardware hash in as a seed to a pseudorandom number generator (PRNG)
4. Use the PRNG to create a public/private keypair

Now the client has a private key that is deterministically derived from its hardware configuration.

Connecting to a server is done like so:

1. Client connects to server
2. Client authenticates their username via trusted authority
3. Client sends public key to server
4. Server sends client a nonce to sign. Nonce MUST have the clients username in it (e.g. `298AF11230E55EA226B64551F4DB1D2D:username`) to prevent MITM attacks.
5. Client verifies the username in the nonce matches their username.
6. Client signs nonce with private key and sends the signature back to the server
7. Server has now confirmed that the client owns the private key
8. Server can now use the previously provided public key as the client's hardware ID

The end result:

1. Clients can still have their hardware IDs "stolen", but this is useless as only the real client has the private key necessary to validate the hardware ID. No more false positives.
2. All servers get the same hardware ID. Administrators don't have to configure anything extra on their owned servers to get hardware IDs synced, and they can ever share the recorded hardware IDs to other administrators.
3. If a private key is compromised that client is screwed, with no way to fix it aside from having server administrators whitelist their hardware ID.
4. Malicious clients can still spoof hardware IDs, but this problem can't be solved. False negatives with hardware ID based alt detection are simply a fact of life.

## Imperfect Solutions

Along the path to the "Client Certificate" solution I brainstormed a number of inferior solutions which I will document here in case you are thinking of 

### 1: Use a Different Unique Identifier

This isn't really a solution. More of a cop-out. But a server could add additional registration steps, such as linking a phone number, a Discord account, etc. This would have to be required on *all* accounts on the server to be effective though. That's quite the extra burden on server administrators to maintain and users to sign up for.

### 2: Salt the Hardware ID with a Server ID

1. User connects to server
2. Server sends a unique server ID
3. User hashes their hardware ID with the server ID, then sends it to the server.

Do you see the problem? A malicious user could connect to the server and steal the server ID. Then they social engineer you into connecting to their fake server, and we're back in the same hole we started in. We've just added an extra step.


### 3: Server Certificate

You might say "isn't this the same thing as the 'Client Certificate' solution, but backwards"? And the answer is yes! The only real difference is server administrators can't share notes.

1. Give the server a public/private keypair.
2. Client connects to server
3. Client authenticates their username via trusted authority
4. Server sends public key
5. Client sends a random nonce to server. Nonce MUST have the clients username in it (e.g. `298AF11230E55EA226B64551F4DB1D2D:username`) to prevent MITM attacks.
6. Server signs nonce with private key, and sends the signature back to the client for verification.
7. Client has now confirmed the server actually owns the private key
8. Client salts hardware ID with server's public key, and sends to server

The end result:
1. hardware IDs are per server
2. an organization can use the same private key across all their servers, and therefore can cross-reference players
3. different organizations cannot share hardware ID information between each other in a useful way. This may be desirable for privacy reasons
4. If a private key is compromised the server will have to rotate and their old database of hardware IDs becomes useless.
5. If a client is compromised they can have their hardware information stolen, which has the exact same impact as the "Client Certificate" solution.
6. Malicious clients can still spoof hardware IDs, but this problem can't be solved. False negatives with hardware ID based alt detection are simply a fact of life.
