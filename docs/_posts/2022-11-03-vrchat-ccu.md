---
layout: post
title: "Effect of Anti-Cheat on VRChat Concurrent Users"
date: 2022-11-03 02:08:33 -0500
modified_date: 2023-02-21 15:18:30 -0600
tags: [vr, vrchat]
author: zkxs
---

It's presently November 3rd, 2022. Three months ago on July 25th, 2022 there was a significant event in the VRChat community: the [Security Update's](https://hello.vrchat.com/blog/vrchat-security-update) introduction of Easy Anti-Cheat (EAC). It was, and still is, very controversial within the VRChat playerbase. However, this post is not about my opinion of EAC: it's about the effect of EAC on VRChat's concurrent users. I believe that three months is long enough to give the numbers time to settle down, and now it's time to do some analysis.

My goal is to clear up exactly how the introduction of EAC affected concurrent user (CCU) numbers. To achieve that I'm going to look at some charts, tell you what I think the numbers mean, and link to my sources. I will include screenshots for ease-of-reading (and in case the sources go down), but I invite you to take a look around the actual charts. They're quite nice.

## Today vs One Year Ago

One common statistic slung around on social media is how VRChat is doing today vs a year ago. Well, I'm not sure that's the best way to look at the data, but lets take look at two 30 day windows.

**One Year Ago** (this data has clearly had its resolution lowered for archival reasons)

![steam reviews over time]({{ site.baseurl }}/img/vrchat-30d-minus-1y.png)

**Past 30 Days**

![steam reviews over time]({{ site.baseurl }}/img/vrchat-30d.png)

One year ago we had peaks around 26k Steam users, and troughs around 17k Steam users [[source](https://metrics.vrchat.community/?orgId=1&from=now-395d&to=now-365d&refresh=30s)]. Today we have peaks around 24k Steam users, and troughs around 12k Steam users [[source](https://metrics.vrchat.community/?orgId=1&from=now-30d&to=now&refresh=30s)]. That's an 8% decrease in peak Steam users, and a 29% decrease in trough Steam users. I can't do a meaningful comparison for total users against year-old data, because the total user data a year ago is very low resolution.

**Side note:** you'll notice I distinguish between "peak" and "trough" CCU. VRChat CCU fluctuates throughout the day, peaking during the evenings in US timezones. Furthermore, CCU is higher on weekends for obvious reasons. I've taken care to do an apples-to-apples comparison between weekday peaks and troughs. This is why it's important to look at the data yourself: it would be very easy for someone to make a mistake (honest or intentional) and cherry-pick numbers to inflate or deflate a percent-difference.

Looking at two 30-day windows obviously isn't going to give us the whole picture: it's been three months since EAC was introduced, and we're only looking at two very small slices of the data. From these two data points alone we can't really reason about if the EAC introduction is the cause of the Steam concurrent user decrease. Lets look at the big picture, now.

## The Big Picture

I want to look at the past three years of data, and we're going to use two different charts just in case anyone has suspicions that one of the sources has bad data.

[metrics.vrchat.community chart](https://metrics.vrchat.community/?orgId=1&from=now-3y&to=now&refresh=30s): I've linked directly to a 3y window. This chart also shows total (Steam + Quest) players, which is neat.

![steam reviews over time]({{ site.baseurl }}/img/vrchat-3y-metrics.png)


[steamdb.info chart](https://steamdb.info/app/438100/graphs/): You have to click to show the 3y window, and you'll need to sign in for high-resolution data.

![steam reviews over time]({{ site.baseurl }}/img/vrchat-3y-steamdb.png)

On both charts we can see that on 2022-07-25, there is a significant drop in Steam players. There hasn't been a similar drop-off in the past three years, and the Steam playerbase has not yet grown back to its previous numbers. The vrchat.community chart shows a 34k to 31k change in peak Steam users (9% drop). The steamdb chart shows a 36k to 32k change in peak Steam users (11% drop).

Steam users are neither increasing nor decreasing at a noteworthy rate, and the concurrent Steam users have still not recovered to their pre-EAC levels.

## Where Are People Going?

VRChat only has two games that are similar enough to examine for migrating users: [ChilloutVR](https://steamdb.info/app/661130/graphs/) and [Neos VR](https://steamdb.info/app/740250/graphs/). You can see from those charts that both games experienced a CCU spike around July 25th. ChilloutVR has ~5x more users now, and Neos VR has ~1.3x more users. Interestingly, that doesn't account for anywhere close to the number of users who left VRChat. So where'd everyone go? Who knows? Maybe they're out touching grass. Imagine.

## Why Are Quest Users Decreasing?

What's surprising to me about the metrics.vrchat.community data is that the EAC introduction is also impacting the total (Steam + Quest) CCU. Total CCU have been declining since around July 25th. In early July, total weekday players were peaking around 75k. Today, they're peaking around 52k. That's a 30% decrease… which is big. This decline is *only* shown in the total player numbers: Steam users are holding steady. This means that we're somehow losing Quest players to attrition. The Quest build does not have EAC, so there should not have been a direct effect on their population. This implies that there's some sort of secondary effect at play here.

**Disclaimer:** this next paragraph is my personal speculation.

I suspect the VRChat Steam rating dropping to "Mixed" may be the cause of this downward trend in Quest users. If there is a lot of churn in Quest users, then the Mixed rating might have reduced the rate of new Quest users joining below the rate of existing Quest users leaving. This theory may be a bit farfetched though, as Quest users don't install VRChat from Steam: they install it from the Oculus Store.

## The Review Bombing

Steam actually has a nice chart for reviews over time… it's just hidden by default. Head over to the [VRChat Steam page](https://store.steampowered.com/app/438100/VRChat/) and Ctrl+F for `show graph`.

![steam reviews over time]({{ site.baseurl }}/img/vrchat-review-bomb.png)

There is an obvious review bomb at July 25th, and it was big enough to bring the all-time reviews down to "Mixed". Recent reviews have already recovered back to "Mostly Positive".

If you, like me, are curious what the threshold for "Mixed" is, there's a very nice [post over on /r/steam](https://www.reddit.com/r/Steam/comments/ivz45n/what_does_the_steam_ratings_like_very_negative_or/) that charts it all out. VRChat is currently at 69% positive reviews. If they hit 70% positive reviews it'll go from "Mixed" back to "Mostly Positive". The way reviews are currently trending this will happen soon. It'll be interesting to see if Quest users start increasing again once the Mixed rating is cleared.

## Christmas is Coming

VRChat traditionally has a large increase in users immediately after Christmas as people are gifted new hardware. Christmas 2021 in particular was huge for VRChat, as it lined up closely with the launch of the Oculus Quest 2 at a very affordable $300 price point. I expect Christmas 2022 to mostly, if not completely, replenish VRChat's CCUs to pre-EAC levels. If you were expecting some sort of "VRChat is dying" conclusion, well, there isn't one. VRChat isn't going anywhere.

## Conclusion

Steam users are down by around 10% post-EAC, and show no signs of recovering to their pre-EAC levels (at least not until Christmas). Total users have dropped by 30% over the past three months, potentially due to the review bomb scaring off new Quest users. While VRChat's CCUs will recover given time, the impact of EAC is measurable and should not be handwaved away.

## Update: March 2023

It's been another three months since I wrote this post. Lets go back through my predictions and see how accurate I was.

> "Mostly Positive"... will happen soon

It did. VRChat is now at 71% positive reviews and as expected has switched from "Mixed" back to "Mostly Positive".

> Christmas 2022 [will] mostly, if not completely, replenish VRChat’s CCUs to pre-EAC levels

According to the [steamdb.info chart](https://steamdb.info/app/438100/charts/) CCUs have recovered, and have even improved slightly. The [metrics.vrchat.community chart](https://metrics.vrchat.community/?orgId=1&from=now-3y&to=now&refresh=30s) shows the same thing, with both total and Steam CCUs being approximately where they were before EAC dropped.
