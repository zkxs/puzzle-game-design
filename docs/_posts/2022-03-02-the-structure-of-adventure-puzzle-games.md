---
layout: post
title: "The Structure of Adventure Puzzle Games"
date: 2022-03-02 10:21:52 -0600
modified_date: 2023-02-21 14:21:50 -0600
tags: [adventure puzzle games, graphing, myst, riven, outer wilds]
author: Michael Ripley
---

Is "adventure puzzle game" the right name for this subgenre? I'm not sure, but I love it. I'm talking about the type of game where you're cast into a new, immersive world. The rules of this world aren't quite like our own. You have to figure out what's going on and how to manipulate the world to progress. Puzzles must be solved, new areas must be explored.

Lets use graphs to take an analytical look at the structure of various games in this subgenre.

# Spoilers ahead!
This writeup will spoil *everything* about the following games:
- Myst
- Riven
- Outer Wilds
  - Echoes of the Eye DLC

If you haven't played all of these consider coming back to this post later. They're great games and it'd be a shame to ruin the experience.

<br><br>

…okay, done playing the games? Lets go, then. It's time for some graphs. As you look at the graphs, keep an eye out for the following:
- Click on the graphs to open a new tab with a pannable, zoomable view
- The breadth (width) of the graphs, which indicates you have more options available
- The depth (height) of the graphs, which indicates how many chained steps are required to get from beginning to end
- How interconnected the nodes are

A lot can be observed about the structure of the game just by glancing at these graphs. How long is the game? How linear is it? Are puzzles completely separate from each other, or is everything connected? Where are the bottlenecks?

# Myst
<a href="{{ site.baseurl }}/svg/myst-puzzle-graph.html" target="_blank"><object id="svg-myst" class="svg" style="pointer-events: none;" type="image/svg+xml" data="{{ site.baseurl }}/svg/myst-puzzle-graph.svg">Your browser does not support SVG</object></a>

- The green node is the start of the game
- Purple nodes are significant puzzles. In other words: places players are likely to spend a long time.
- The red nodes are endings
- Solid edges are mandatory (without progression skips)
- Dashed edges represent very helpful knowledge for progression, but are technically optional. They have mouse-over tooltips with more detail.

## Analysis

1. Start out doing some confused wandering on Myst Island
2. Huge bottleneck at figuring out the tower rotation
3. Four separate lead-up puzzles to each age
4. Four separate ages. Notably, you can't leave the age until you've found the exit. For Channelwood the exit can be found relatively early. For the other ages it's typically the *last* thing you'll find.
5. A relatively short endgame once you've solved all four ages.

Myst's structure is very simple. As the ages generally can't be left early, you can't solve ages in parallel. This means the game is gong to naturally form a single linear progression chain as you go through it. The only time you have more than one option available is when you're at Myst island trying to get into a new age. This is a recipe for frustration, as if there's only one path forward then every time a puzzle stumps you all your momentum is gone. Every puzzle can become a brick wall, completely halting all progression.

There's also negligible inter-age dependencies. The most glaring inter-age dependency, the sounds of the cardinal directions, has a glaring flaw: half the time you'll visit the ages in the wrong order to get the hint. And even if you passed the coinflip, if your notes or memory are lacking you miss out anyways. The other inter-age dependency is the library showing where the lever is in Channelwood's maze of a second level. This time you can actually backtrack to read the book, but many players just wander aimlessly until they find the lever.

# Riven

<a href="{{ site.baseurl }}/svg/riven-puzzle-graph.html" target="_blank"><object id="svg-riven" class="svg" style="pointer-events: none;" type="image/svg+xml" data="{{ site.baseurl }}/svg/riven-puzzle-graph.svg">Your browser does not support SVG</object></a>

- The green node is the start of the game
- Purple nodes are significant puzzles. In other words: places players are likely to spend a long time.
- The red nodes are endings
- Solid edges are mandatory (without progression skips)
- Dashed edges represent very helpful knowledge for progression, but are technically optional. They have mouse-over tooltips with more detail.

## Analysis

1. Low branching in the beginning of the game. Your choices are rotating room or explore the village/boiler islands.
2. Once you explore a bit there's a few main clusters you need to solve independently
   - The rotating room
   - The orb scavenger hunt
   - The submarine, and eventually learning the numbers 1-24
   - The whole boiler → frog-hall fiasco where you don't realize there's more behind the door
3. Once you wrap up those threads there's the big puzzle, requiring the following
   - island → color mapping
   - island → dome coordinate mapping
4. Now you're in the endgame, and things get very linear

Riven's progression graph is much more interconnected than that of its predecessor. At any given time you'll likely have two or three different progression threads to follow, which is great if you're stumped and need to take a break from one puzzle. Eventually things will funnel into the final puzzle: the fire marbles. Once you're past that you're off to the endgame, where your options become much more limited. In fact, once Catherine is rescued your options are artificially limited by Catherine trapping you near the telescope. I can only assume this is because playtesters were struggling with piecing together how to signal Atrus. This makes sense, as the telescope is intentionally designed to feel like a fluff object with no progression purpose.

# Outer Wilds

<a href="{{ site.baseurl }}/svg/outer-wilds.html" target="_blank"><object id="svg-outerwilds" class="svg" style="pointer-events: none;" type="image/svg+xml" data="{{ site.baseurl }}/svg/outer-wilds.svg">Your browser does not support SVG</object></a>

A [graph without DLC spoilers]({{ site.baseurl }}/svg/outer-wilds-no-dlc.html) is also available, which might be useful for showing to a friend.

**Note:** We've changed the legend a bit here, notably what dashed and dotted edges mean.

- The green node is the start of the game
- Purple nodes are significant knowledge.
  - For the main game I've chosen the three pieces of knowledge you need to end the game.
  - For Echoes of the Eye I've chosen the main places that gate progression.
- The red nodes are endings
- Nodes with asterisks have mouse-over tooltips with more detail about progression requirements and skips.
- Solid edges are mandatory (without progression skips). You must have all of the solid edges to progress.
- Dashed edges represent either-or requirements. You must have at least one of the dashed edges to progress.
- Dotted edges represent very helpful knowledge for progression, but are technically optional.

## Analysis

1. Do the "tutorial"
2. *Massive* branching. There are so many places you can go. More even than pictured here, as many places just contain hints that funnel you towards the important knowledge.
3. While there are three main critical pieces of knowledge you need to finish the game, note how there are *not* three main clusters. There's a lot of interdependency going on.
4. Once you have all three pieces of knowledge there's no endgame progression beyond forming a plan and executing it.

- The quantum moon is a whole side thing where you collect three quantum rules as you explore for the main progression.
- Echoes of the Eye is another side thing, but much larger.
  1. Starting out there's a lot to explore but only three things you can do
     - Follow the trail from the Cinder Isles slide room to gaining access to the green fire rooms
     - Find the hidden gorge
     - Figure out how to get inside the submerged structure
  2. Now you can gain access to the dream world, and there's suddenly a lot to explore but not much to do. The only progression is seeing the sealed vault's vision, and using that to eventually get into the abandoned temple's secret room.
  3. Treasure hunt for three slide burning rooms, each of which gets you into a forbidden archive where you learn a critical piece of information
  4. Combine the three critical pieces of information to free the prisoner

### High Branching
The massive branching at the beginning of the game is interesting. I see some players who are overwhelmed by it and focus too much on the question: "where am I supposed to go?". Many gamers are so used to linear progression that their kneejerk reaction when it's suddenly gone is that the game must be poorly designed, and there's "nothing to do". Ironic that having too many options makes people think there's too few. However, Mobius Digital has clearly designed for this as the Hearthians in the village give you prods to go check various planets. Eventually players realize they can go wherever their fancy takes them, and that's when the game starts to make sense to them.

### Bottlenecks
The main game doesn't really have any bottlenecks. It's not difficult to learn something new every loop, and eventually you'll have learned everything you need. It's simply a matter of going everywhere, and there aren't really any puzzles that would stump you. The main barrier to progression I see here is players focusing too hard on one place and trying to brute force their way in when they're supposed to have learned a trick somewhere different. For example: trying to get into the black hole forge before understanding the warp towers.

The quantum moon is a different deal. While it looks small, this is more difficult than the main progression. Because it's optional content Mobius Digital was able to crank up the challenge a bit. This causes the quantum moon progression to behave like a mysterious side story: sometimes you'll get a little whisper of spooky quantum stuff. Maybe you ignore it, or maybe it motivates you to get to the bottom of this quantum shenanigans once and for all. The main barriers to progression I see here are players failing to form a correct understanding of the quantum rules despite having them spelled out, and not realizing how to get into the Tower of Quantum Knowledge.

Finally, Echoes of the Eye. There's much less breadth to this subgraph, meaning you have fewer options available for progression. This is why I've selected the purple nodes differently here. The main game doesn't really have a progression barrier beyond the three endgame knowledge checks. Conversely, Echoes of the Eye has a number of barriers. It doesn't end up *feeling* linear, though, as there's still a lot of lore to explore. However, you'll likely end up at a point where your progress dwindles because you've missed one of the few progression nodes. This can be frustrating because there's a very large area to cover and only one or two places you actually need to be. Lore-wise, this makes a lot of sense as the Pursuers have tried to intentionally conceal all their secrets… but they've missed a few spots. Echoes of the Eye delivers an experience where, unlike the base game, you have a strong focus on one area and keep looping back to it repeatedly. That area has more depth than the base game, but much less breadth. As far as size goes, Echoes of the Eye is surprisingly large, being almost the size of the base game.

### These Three Simple Tricks Your Game Doesn't Want you to Know
Mobius Digital *really* likes the pattern of having three critical pieces of knowledge that when combined solve some huge puzzle. They've done it for the main game, the quantum moon, and Echoes of the Eye. And I must say: it works pretty dang well. It helps keep things from being overly linear, and when you finally put everything together it's quite satisfying. They've clearly got a great formula here, and they know it.
