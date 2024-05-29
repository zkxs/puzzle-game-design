---
layout: post
title: "DRAFT: The Design of Puzzles"
date: 2022-03-06 00:39:33 -0600
tags: [adventure puzzle games]
author: zkxs
---

I've already talked about [the design of adventure puzzle games]({{ site.baseurl }}{% post_url 2022-03-02-the-structure-of-adventure-puzzle-games %}), so now lets take a deeper dive into individual puzzles.

- What are the stages of a puzzle
  - information gathering
    - before you see the puzzle
    - after you see the puzzle
  - identification
    - is it immediately obvious that this thing is a puzzle?
    - is there some sort of knowledge required to know this is a puzzle?
    - conversely, do you have things that *aren't* puzzles that might be mistaken for puzzles?
  - execution
  - payoff
- What makes a puzzle fun?
  - Breakthrough moment where you realize how to solve it
  - Executing the solution
  - Whatever payoff the game gives you
    - What if the game "rewards" you with something you don't want? Like a lore dump where the player doesn't care?
- What happens if the player doesn't know what to do?
  - Is that on them? Should they feel bad?
  - Is there a hint system?
    - This could be a direct "help me" button
    - This could also be much more subtle
      - Repetition of themes can train players in what's expected of them, so they'll "get it" when they revisit the puzzle
      - Scatter hints around the world, so as they explore more they have more and more prods to a puzzle
  - Is there something else they can do while their brain subconsciously works on it?
  - Is the puzzle optional?
- What is the experience you want your player to have?
  - How do you build something that provides that experience?
  - What happens if something goes wrong?
- Cause and Effect
  - player interaction should have immediately visible output
- Short term and long term goals
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
