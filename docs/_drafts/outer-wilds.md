---
layout: post
title: "DRAFT: Outer Wilds"
date: 2022-03-09 07:01:37 -0600
tags: [adventure puzzle games, outer wilds]
---

Some quick and dirty outer wilds notes.


## Design
Outer Wilds is a cohesive world with a compelling design and story. The interconnected threads you follow to the final conclusion are an incredible way to deal with progression. Using knowledge as the key to progression is genius. I didn't expect to see anything of this quality in the genre made by a company other than Cyan, and then in 2019 Mobius Digital casually releases the best game since Riven was released in 1997. And what's more, they managed to do it so well that *everyone* likes it, while Cyan is still struggling along as a maker of niche games. And then they did it *again* with Echoes of the Eye.

## Math

- 9,318,054 loops until probe finds an eye of the universe, ~22 minutes per loop.  
- That is ~390 years since the sun started exploding.  
- After not receiving a command for over ten minutes due to the death of the Nomai, the Sun Station went into sleep mode and has been offline for 281,042 years.  
- The Nomai are only 2 or 3 generations in before they get ghost-matter'd.  

## Things you really shouldn't know

### The eye's coordinates

1. `L` tilted clockwise slightly
2. Hourglass minus bottom
3. `N` but with swag

### Echoes of the Eye Codes

#### Eye Signal Blocker Shack

4, -2, -1, -2, -1

1. ☀️ sun
2. 👁️ eye
3. 🔥 fire
4. 👁️ eye
5. 🔥 fire

#### Abandoned Temple Elevator

0, 3, 0, -3, -3

1. 🌒 crescent
2. 🪐 ringed planet
3. 🌒 crescent
4. ✨ star
5. ✨ star

#### Seal 1 (datamined)
Does nothing?

0, 1, 2, -2, 3

1. 🌒 crescent
2. 🌓 half-moon
3. 🌔 gibbous
4. 👁️ eye
5. 🪐 ringed planet

#### Seal 1 (actual)
Aligns the invisible bridge

-3, 0, 2, -2, 3

1. ✨ star
2. 🌒 crescent
3. 🌔 gibbous
4. 👁️ eye
5. ✨ star

#### Seal 2 (datamined)
Summons the raft

-3, 4, 3, -1, 2

1. ✨ star
2. ☀️ sun
3. 🪐 ringed planet
4. 🔥 fire
5. 🌔 gibbous

#### Seal 3 (datamined)
Deactivates the bridge's light

1, 2, 3, 2, 1

1. 🌓 half-moon
2. 🌔 gibbous
3. 🪐 ringed planet
4. 🌔 gibbous
5. 🌓 half-moon

### Subterranean Lake Map

```
           Starlit Cove ← [2]

Shrouded Woodlands ← [1]   •   [3] → Endless Canyon

                          [4] → The seals
```
Silly trivia: the seals don't point towards their matching forbidden archives

## Achievements

### Beginner's Luck
Reach the Eye of the universe in one loop.

NOTE: If you die at any point, you need to quit and start a new expedition again, this needs to be done in a single loop. 

1. Speedrun to Launch codes
2. Get distress signal at ember twin
3. Loiter until ash twin is empty enough
4. Slam jam your ship between the warp towers
5. Steal that fucking core
6. Bramble escape pod
7. Scout the fucking seed
8. Slide into the vessel
9. WIN

### Ghosts in the Machine
Reach all 3 Forbidden Archives in a single loop without getting caught.

You must take each archive's elevator for it to count as visited. In the Shrouded Woodlands case this means you may have to take the elevator *up* for credit, depending on if you route it last.

Travelling in the dream, vs traveling in the stranger?
- I don't think we have to do it in one consecutive dream. If we do the route is a bit more cursed.
  - The process
    1. Start at area A
    2. Open dock A, wake up
    3. Travel from area A to area B IRL
    4. Open dock B, wake up
    5. Travel from area B to area C IRL
    6. Do archive C, backtrack to dock C
    7. Raft to dock A, do archive A, backtrack to dock A
    8. Raft to dock B, do archive B
  - Steps broken down by region:
    - A: open dock, do archive from dock, backtrack to dock
    - B: open dock, do archive from dock
    - C: do archive from spawn, backtrack to dock
  - Steps broken down by step:
    - 2X open dock, abort
    - 1X do archive from spawn
    - 2X do archive from dock
    - 2X backtrack to dock
- Therefore, we assume we can wake up as long as we don't get *caught*

The archives:
1. River Lowlands -> Shrouded Woodlands -> Tunnel Clip Trick
   - Through the fireplace
   - Can it be skipped via raft tunnel clipping?
   - Only doable after the dam is broken
   - The cannot be YOLO'd past.
   - ENTRANCE: blow open a door
2. Cinder Isles -> Starlit Cove -> Dead IRL Trick
   - You NEED to be dead to do this efficiently. Therefore, we have two options:
     - Do it last
     - Leave without death warping
   - ENTRANCE: light boathouse after going a teensy bit CW around the ring
   - No invisible bridges
3. Hidden Gorge -> Endless Canyon -> Ditch Lantern Trick
   - Quick entrance as well as last to fall in water makes it a strong start option
   - Hop through the painting to skip a bunch of bullshit and immediately darken shit
   - Take the second invisible bridge to skip some bullshit?
   - ENTRANCE: must have lowered chain elevator

#### Multi-dream Route
1. Hidden Gorge -> Endless Canyon
   1. Left to secret tunnel fuckery, shortcut to turn off lights
   2. Deathwarp, go back in
   3. Right to bridge fuckery, shortcut past elevator
   4. Sneak past spooks and through painting
   5. Deathwarp
2. Die at Cinder Isles (Island Tower) -> Starlit Cove
   1. Hang a left and activate the dock
   2. Walk through Starlit Cove, ignoring alarms
   3. Backtrack to dock
   4. Raft to transition, yeet self into Shrouded Woodlands archive, take the elevator up
3. Done

Cost:
- 3 IRL quarter turns, pass the dam
- 1.5 dream quarter turns
- 1 archive -> dock backtracks

The drawbacks:
- Nothing

The benefits:
- Only one backtrack, and it's an easy one
- We do Endless Canyon, the most difficult bit, first
- Shrouded Woodlands is last, so the dam timing is good

#### One Dream Route
The gist: Unlock all the docks, then do cinder

1. Setup
   1. Go to Hidden Gorge, use invisible bridge to drop elevator at Endless Canyon dock, deathwarp
   2. Go back into Endless Canyon, use secret passage to extinguish lights, deathwarp
   3. Go to River Lowlands, open Shrouded Woodlands dock, deathwarp
2. Go to Cinder Isles (Island Tower), die at fire
3. Execute The Run
   1. Do Starlit Cove archive (low risk)
   2. Backtrack to dock, and go
   3. Skip the dream Sealed Vault (there's nothing for us there)
   4. Do Endless Canyon archive (medium risk)
   5. Backtrack to dock, and go
   6. Raft to transition, yeet self into Shrouded Woodlands archive, take the elevator up
4. Done

Cost:
- 3 IRL quarter turns, pass the dam
- 1.5 dream quarter turns
- 2 archive -> dock backtracks

The drawbacks:
- Have to backtrack through endless canyon

The benefits:
- Swag
- Shrouded Woodlands is last, so the dam timing is good

## Freeing the Prisoner
Requirements:
1. Seal 1: Ditch lantern
2. Seal 2: Clip to it from a transition
3. Seal 3: Be dead
4. Sealed Vault -> Subterranean Lake  
   Need to end here. Can we get in from another area? Yes, we can get to it from the tunnel clip.

Potential Starting points:
- Hidden Gorge: buys you a lot of time, pretty short trip to the dream rafts
- River Lowlands: shortest trip to dream rafts?

### Route
1. Enter dream by dying at Hidden Gorge fire
2. Proceed directly to raft
   1. No need to put out lights
   2. Head right from start and take the invisible bridge to the elevator
3. Clip out of bounds from the raft
4. Water walk to Seal 2, and remove it for free
5. Take the raft to the coffin
6. Open Seal 1 by using your debug vision
7. Open Seal 3 by being dead (remember step 1?)
