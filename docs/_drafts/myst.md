---
layout: post
title: "DRAFT: Myst"
date: 2022-03-02 10:21:52 -0600
tags: [adventure puzzle games, myst]
---

Some quick and dirty Myst notes.

## Puzzle Design
Myst has a couple of puzzles that have an intended solution, but also have a degenerate solution. Specifically, the Selenetic maze and the second layer of Channelwood can both be brute forced. Because the intended solutions are non-obvious and brute forcing is viable, many people take the obvious, but frustrating route. This is poor design. If a puzzle is brute-forcible, then it needs to have such a large solution space that it is clearly infeasible to attempt. Another puzzle with an extremely obscure solution is the clocktower puzzle. It is provable via game theory or modular algebra that 2,2,1 is impossible to achieve with single lever pulls, but players are never going to do math proofs. The puzzle appears designed to be intentionally frustrating until you hold your mouse button down in a fit of rage.

Putting it all together, Myst's simple structure and puzzle design issues make it a mediocre game. Its most noteworthy quality is that it's a classic. If not for its fame and how it revolutionized the genre it wouldn't be worth mentioning compared to other, much stronger puzzle games.

## Clock Tower Puzzle
- You have exact control over the top and bottom gear
- The middle gear's position is the sum of the top and bottom offsets
- Modulo three
- This means (top-1 + bottom-1) % 3 = middle-1
- In other words, middle = (top + bottom) % 3 + 1
- so 3?3 is guaranteed to be 333 because 3 + 3 = 6, the the modulo gets us back to 3
- We're shooting for 221
- However, 2?1 is guaranteed to be 231
- Therefore, you're missing something

## Cardinal directions
| Sound   | Direction |
| ------- | --------- |
| Ding    | North     |
| Pshhh   | East      |
| Plink   | South     |
| Clatter | West      |

## Stoneship fuckery

Observe:

- Telescope has 5 degree increments
- Compass has 32 divisions, or 11.25 degree increments

This breaks people's brains.

### Pump buttons

| Button | Area       |
| ------ | ---------- |
| Left   |            |
| Middle |            |
| Right  |            |
|        | Bedrooms   |
|        | Lighthouse |
|        | Exit room  |

## Myst Tier List
1. Riven
   - Clear winner.
   - Very good puzzle design.
   - Incredibly well put together world.
   - Concise plot. Get in, defeat bad guy, save princess, get out. It's simple and it works.
   - Renders are a big step up in quality from Myst.
2. Myst III: Exile
   - Same basic formula as the original Myst, but minus all the flaws.
   - Saavedro is the best villain.
   - Great plot.
   - All five ages have incredible art design.
   - Engine is a step up in quality from Riven.
3. Myst
   - The original, the classic.
   - Has some poor puzzle design.
   - Not a fan of the surrealism. "But what if we throw a clock in it?" Yeah okay Salvador Dalí.
4. Myst Online: Uru Live Again (MOULA)
    - Multiplayer was a mistake. Huge misdirection of effort.
    - Realtime 3D is not good
      - It is big a step down in visual quality. Remember Myst IV came before it and looked *incredible*.
      - Controls are awful.
      - Third person is cringe.
      - Ridiculous walk/sprint mechanic that uses CAPS LOCK!?
      - Jumping was a mistake. The Myst series did not need platforming.
    - Ahnonay is incredibly good
    - On average the *real* ages are pretty good. I'm not counting the ones that were obviously low-effort filler. 
    - The low-effort filler ages (pods and Minkata) suck.
5. Myst IV: Revelation
   - Objectively the best engine of any of the games. The visuals are *beautiful*.
   - Objectively the worst writing of any of the games. The plot is some fever-dream bullshit.
   - The acting is pretty bad.
   - Spire is actually pretty dang cool.
   - Tomahna is okay, but it's just a hub.
   - Haven is mildly cursed.
   - Serenia is incredibly cursed (especially the ending, oh god).
   - Because half the ages are awful, I consider it half of a game.
6. Uru
    - Botched version of MOULA. MOULA is objectively better, and it's *free*.
    - There's no reason to play it, but for completion's sake I've rated it here as if MOULA didn't exist.
7. Myst V: End of Ages
    - Realtime 3D is still not good. See above for more details.
    - The plot is pretty mediocre.
    - Incredibly creepy and awful face animation.
    - 2 of the ages feel very samey, artistically.
    - Only one of the ages is interesting.
    - The drawing mechanic is super scuffed.
    - The puzzles are pretty bland, in part due to many of them being tied to the tablet mechanics.
