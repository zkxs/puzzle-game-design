---
layout: post
title: "The Design of Adventure Puzzle Games"
date: 2022-03-02 10:21:52 -0600
categories: [adventure puzzle games, graphing]
---
<script src="/js/svg-pan-zoom.js"></script>
<script>
function registerSvg(id) {
    var element = document.getElementById(id);
    var panZoom = svgPanZoom(element, {
        controlIconsEnabled: true,
        mouseWheelZoomEnabled: false,
        preventMouseEventsDefault: true,
        fit: true,
        center: true,
        zoomScaleSensitivity: 0.75,
        minZoom: 0.25,
        maxZoom: 15
    });
    window.addEventListener('resize', function() {
        panZoom.resize();
    });
    console.log("Ran SVG setup for " + id);
}
</script>

Is "adventure puzzle game" the right name for this subgenre? I'm not sure, but I love it. I'm talking about the type of game where you're cast into a new, immersive world. The rules of this world aren't quite like our own. You have to figure out what's going on and how to manipulate the world to progress. Puzzles must be solved, new areas must be explored.

Lets take an analytical look at various games in this subgenre, and think about what makes a game good.

# Inventory
There's two types of puzzle games: those with an inventory mechanic, and those without. There's a problem with inventory mechanics: they're very difficult to design in a way that's not incredibly frustrating. The problems are simple:
- If it is immediately obvious where items should be used, then the mechanic is nearly meaningless. This encourages game designers to make items less obvious.
- If it is not obvious where items should be used, then the player ends up having to backtrack and use them on everything in the world. This is extremely frustrating.
- If the game includes crafting, then things become an order of magnitude worse. Lets look at the process when you obtain an item
  1. Attempt to craft it with everything else in your inventory
  2. Backtrack and attempt to use it on everything in the world
  3. Fail, because it turns out the item was the second ingredient to a recipe that you lack the third ingredient for

This means that to design an inventory mechanic well, you have to nail the sweet spot where items aren't incredibly obvious, but you can logically think it out and be rewarded when your theory proves correct. This is incredibly difficult to do, as evidenced by how few games have succeeded in doing it.

The alternative to all this is just completely throwing inventory mechanics out of the window, with progression achieved by discovering secrets or manipulating the world state. This sort of game design is apparently harder to screw up, as evidenced by a number of puzzle games that have taken this approach to great effect. We'll look at some of these games in more detail.

# Spoilers ahead!
This writeup will spoil *everything* about the following games:
- Myst
- Riven
- Outer Wilds
  - Echoes of the Eye DLC

If you haven't played all of these consider coming back to this post later. They're great games and it'd be a shame to ruin the experience.

<br><br>

…okay, done playing the games? Lets go, then. It's time for some graphs. As you look at the graphs, keep an eye out for the following:
- The breadth (width) of the graphs, which indicates you have more options available
- The depth (height) of the graphs, which indicates how many chained steps are required to get from beginning to end
- How interconnected the nodes are

A lot can be observed about the structure of the game just by glancing at these graphs. How long is the game? How linear is it? Are puzzles completely separate from each other, or is everything connected? Where are the bottlenecks?

# Myst

<object id="svg-myst" class="wide svg" type="image/svg+xml" data="/svg/myst-puzzle-graph.svg" onload="registerSvg('svg-myst')">Your browser does not support SVG</object>

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

There's also negligible inter-age dependencies. The most glaring inter-age dependency, the sounds of the cardinal directions, has a glaring flaw: 50% of the possible age orderings go in the wrong order to get the hint. And even if you passed the coinflip, if your notes or memory are lacking you miss out anyways. The other inter-age dependency is the library showing where the lever is in Channelwood's maze of a second level. This time you can actually backtrack to read the book, but many players just wander aimlessly until they find the lever.

This is a nice segway into another issue with Myst: its puzzle design. Myst has a couple of puzzles that have an intended solution, but also have a degenerate solution. Specifically, the Selenetic maze and the second layer of Channelwood can both be brute forced. Because the intended solutions are non-obvious and brute forcing is viable, many people take the obvious, but frustrating route. This is poor design. If a puzzle is brute-forcible, then it needs to have such a large solution space that it is clearly infeasible to attempt. Another puzzle with an extremely obscure solution is the clocktower puzzle. It is provable via game theory or modular algebra that 2,2,1 is impossible to achieve with single lever pulls, but players are never going to do math proofs. The puzzle appears designed to be intentionally frustrating until you hold your mouse button down in a fit of rage.

Putting it all together, Myst's simple structure and puzzle design issues makes it a mediocre game. Its most noteworthy quality is that it's a classic. If not for its fame and how it revolutionized the genre it wouldn't be worth mentioning compared to other, much stronger puzzle games.

# Riven

<object id="svg-riven" class="wide svg" type="image/svg+xml" data="/svg/riven-puzzle-graph.svg" onload="registerSvg('svg-riven')">Your browser does not support SVG</object>

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

Riven's progression graph is much more interconnected than that of its predecessor. At any given time you'll likely have two or three different progression threads to follow, which is great if you're stumped and need to take a break from one puzzle. Eventually things will funnel into the final puzzle: the fire marbles. Once you're past that you're off to the endgame, where your options become much more limited. In fact, once Catherine is rescued your options are artificially limited by Catherine trapping you near the telescope. I can only assume this is because playtesters were struggling with piecing together how to signal Atrus without having the game's scope significantly narrowed. This makes sense, as the telescope is intentionally designed to feel like a fluff object with no progression purpose.

Cyan has clearly learned from the mistakes of Myst, as Riven's puzzles are much better designed. Notably, the frustrating brute-forcible puzzles are gone. Instead, Riven's most frustrating aspect is how it punishes the player for failing to observe inconspicuous details. Riven has a number of small, important items that are very easy to miss. In some cases, perhaps most notably the lever that grants access to the top of the giant golden dome, it becomes harder to find the longer it's been since you missed it. This is because the lever is in a hall, and once players believe they are familiar with a hall they click through it very quickly. All of the other cases of inconspicuous levers and doors in Riven have some sort of tell that indicates there's an area the player needs to get to, leading back to the easy-to-miss button or door. The top of the golden dome has no such tell.

The takeaway is that with Riven, Cyan took the idea of Myst and simply added incredible polish. The puzzles are better designed, more interconnected, and feel like they're seamlessly part of the world.

# Outer Wilds

<object id="svg-outerwilds" class="wide svg" type="image/svg+xml" data="/svg/outer-wilds.svg" onload="registerSvg('svg-outerwilds')">Your browser does not support SVG</object>

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
- Edges of the eye is another side thing. 
  1. Starting out there's a lot to explore but only three things you can do
     - Follow the trail from the Cinder Isles slide room to gaining access to the green fire rooms
     - Find the hidden gorge
     - Figure out how to get inside the submerged structure
  2. Now you can gain access to the dream world, and there's suddenly a lot to explore but not much to do. The only progression is seeing the sealed vault's vision, and using that to eventually get into the abandoned temple's secret room.
  3. Treasure hunt for three slide burning rooms, each of which gets you into a forbidden archive where you learn a critical piece of information
  4. Combine the three critical pieces of information to free the prisoner

### High Branching
The massive branching at the beginning of the game is interesting. I see some players who are overwhelmed by it and focus too much on the question: "where am I supposed to go?". Many gamers are so used to linear progression that their kneejerk reaction when it's suddenly gone is that the game must be poorly designed, and there's "nothing to do". Ironic that having too many options makes people think there's too few. However, Mobius Digital has clearly designed for this as the Hearthinians in the village give you prods to go check various planets. Eventually players realize they can go wherever their fancy takes them, and that's when the game starts to make sense to them.

### Bottlenecks
The main game doesn't really have any bottlenecks. It's not difficult to learn something new every loop, and eventually you'll have learned everything you need. It's simply a matter of going everywhere, and there aren't really any puzzles that would stump you. The main barrier to progression I see here is players focusing too hard on one place and trying to brute force their way in when they're supposed to have learned a trick somewhere different. For example: trying to get into the black hole forge before understanding the warp towers.

The quantum moon is a different deal. While it looks small, this is more difficult than the main progression. Because it's optional content Mobius Digital was able to crank up the challenge a bit. This causes the quantum moon progression to behave like a mysterious side story: sometimes you'll get a little whisper of spooky quantum stuff. Maybe you ignore it, or maybe it motivates you to get to the bottom of this quantum shenanigans once and for all. The main barriers to progression I see here are players failing to form a correct understanding of the quantum rules despite having them spelled out, and not realizing how to get into the Tower of Quantum Knowledge.

Finally, Echoes of the Eye. There's much less breadth to this subgraph, meaning you have fewer options available for progression. This is why I've selected the purple nodes differently here. The main game doesn't really have a progression barrier beyond the three endgame knowledge checks. Conversely, Echoes of the Eye has a number of barriers. It doesn't end up *feeling* linear, though, as there's still a lot of lore to explore. However, you'll likely end up at a point where your progress dwindles because you've missed one of the few progression nodes. This can be frustrating because there's a very large area to cover and only one or two places you actually need to be. Lore-wise, this makes a lot of sense as the Pursuers have tried to intentionally conceal all their secrets… but they've missed a few spots. Echoes of the Eye delivers an experience where, unlike the base game, you have a strong focus on one area and keep looping back to it repeatedly. That area has more depth than the base game, but much less breadth. As far as size goes, Echoes of the Eye is surprisingly large, being almost the size of the base game.

### These Three Simple Tricks Your Game Doesn't Want you to Know
Mobius Digital *really* likes the pattern of having three critical pieces of knowledge that when combined solve some huge puzzle. They've done it for the main game, the quantum moon, and Echoes of the Eye. And I must say: it works pretty dang well. It helps keep things from being overly linear, and when you finally put everything together it's quite satisfying. They've clearly got a great formula here, and they know it.

### The Takeaway
Outer Wilds is a cohesive world with a compelling design and story. The interconnected threads you follow to the final conclusion are an incredible way to deal with progression. Using knowledge as the key to progression is genius. I didn't expect to see anything of this quality in the genre made by a company other than Cyan, and then in 2019 Mobius Digital casually releases the best game since Riven was released in 1997. And what's more, they managed to do it so well that *everyone* likes it, while Cyan is still struggling along as a maker of niche games. And then they did it *again* with Echoes of the Eye.
