---
layout: post
title: "Eye and Face Tracking in Virtual Reality"
date: 2024-06-01 14:18:26 -0500
tags: [vr, vrchat]
author: zkxs
---

This post focuses on comparing headsets with eye and face tracking support. If you already have a Quest and are just interested in reading about PCVR setup, take a look at [this post]({{ site.baseurl }}{% post_url 2024-06-01-quest-pro %}) instead.

I believe that eye and face tracking are the next steps in terms of interacting with people in VR, and eye tracking also enables all manner of new technology from foveated rendering to new types of user interface. However, the unfortunate reality is that eye and face tracking are still extremely niche and there are not many options available today.

If your curious what all this looks like in action, take a look at [this video](https://www.youtube.com/watch?v=F_ptjZ8Dl5E) where Phia from the Virtual Reality Show discusses her experiences with eye and face tracking in VRChat.

### Past Options

Some eye and face tracking solutions are discontinued. You may still be able to find one on eBay. I'm not going to go into too much detail on these as I want to focus on things that are actually being sold.

- Vive Pro Eye
- vive Facial Tracker

### Present Options

There are eye and face tracking solutions available right now. These are the options we're going to focus on.

- Meta Quest Pro
- Pico 4 Pro
- DIY something yourself
  - [EyeTrackVR](https://docs.eyetrackvr.dev/)
  - [Project Babble](https://github.com/Project-Babble/ProjectBabble)

### Future Options

Some headsets that are speculated will have eye and face tracking are not yet released. If you're unimpressed with the presently available options you may wish to wait for some future headset.

- **Meta Quest Pro 2** is slated for release in 2027. <sup>[[source](https://www.androidcentral.com/gaming/virtual-reality/meta-quest-pro-2-new-display-delay)]</sup>
- **Valve**'s next headset is only rumors and speculation. There is no release date: it may very well be shelved for all we know.
- DisplayPort v1.4 is causing a display bandwidth bottleneck for wired headsets, so vendors may be waiting for **DisplayPort 2.1** to become available. NVIDIA GPUs don't support this yet, not even high end ones. RTX 4000 series don't do it. RTX 5000 series will [allegedly support it](https://videocardz.com/newz/nvidia-geforce-rtx-50-series-to-feature-displayport-2-1-using-tsmc-3nm-node). AMD's RDNA cards already support DisplayPort 2.1.

### Index vs Quest Pro Specifications

|                    | Index      | Quest Pro    |
| ------------------ | ---------- | ------------ |
| Release Date       | 2019       | 2022         |
| Sold in US         | Yes        | Yes          |
| Resolution per eye | 1440x1600  | 1800×1920    |
| Refresh Rate       | 144hz      | 90hz         |
| Weight             | 809g       | 722g         |
| Wireless           | No         | Yes          |
| Battery life       | N/A        | 2 hours      |
| Eye Tracking       | No         | Yes          |
| Face Tracking      | No         | Yes          |
| Tracking System    | Lighthouse | Camera-based |

### Face Tracking Comparison

|                  | Quest Pro | Vive Pro Eye + SRanipal         |
| ---------------- | --------- | ------------------------------- |
| Tongue           | Binary    | Analog in/out side/side up/down |
| Cross-eyed       | No        | Yes                             |
| Pupil dilation   | No        | Yes                             |
| Lip bite         | Yes       | ?                               |
| Jaw side-to-side | Yes       | Yes                             |
| Eyebrow          | Yes       | No                              |

Some other notes:
- Quest Pro has a known issue where if you sweat in it too much it can brick the eye tracking (but apparently the warranty is very good while it lasts, perhaps consider the 2-year extended warranty?)
