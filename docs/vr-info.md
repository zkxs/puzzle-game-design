---
layout: page
title: VR Info
permalink: /vr/
sitemap: false
---

This page lists my specific hardware and software setup for running VR. This is mostly for my own reference.

## Hardware

### PC

| Part Type   | Part Model                         | Noteworthy Specs                      |
| ----------- | ---------------------------------- | ------------------------------------- |
| CPU         | AMD Ryzen 7 7800X3D                | 8 core 16 thread 4.2 GHz (5GHz boost) |
| GPU         | Nvidia RTX 3090 FE                 | GDDR6X 24GB                           |
| RAM         | G-Skill F5-6400J3239F24GX2-RS5K    | DDR5 48GB (2x24GB) 5200 Mhz           |
| SSD         | Western Digital WDBRPG0010BNC-WRSN | 1TB, 3470 MB/s read, 3000 MB/s write  |
| Motherboard | ASRock X670E PG Lightning          |                                       |
| PSU         | Corsair RM1000x                    | 1000W                                 |
| CPU Cooler  | Thermalright Phantom Spirit 120    |                                       |

### VR

- Meta Quest Pro
- 3x Valve Index Base Station 2.0
- 2x Valve Index Controllers
- 4x Vive 2.0 Trackers
- 5x Vive 3.0 Trackers
- 3.5m x 3.3m playspace

### Network

- crappy old Dell running pfSense acting as a wired router
- TP-Link AXE5400 acting as a wireless AP
- 1000 Mbps down / 35 Mbps up cable internet

## Software

- Windows 11
- [SteamVR Beta client](https://help.steampowered.com/en/faqs/view/4F5E-AD22-7402-2EAD)
- [Steam Link for Meta Quest](https://help.steampowered.com/en/faqs/view/0E2C-406B-9135-38A4)
- [VRCFaceTracking](https://docs.vrcft.io/) for face tracking
- [OpenVR Space Calibrator (hyblocker fork)](https://github.com/hyblocker/OpenVR-SpaceCalibrator) for Meta/SteamVR playspace alignment
- [OVR Lighthouse Manager](https://github.com/kurotu/OVR-Lighthouse-Manager) for base station power management
- [OpenVR Advanced Settings](https://store.steampowered.com/app/1009850/OVR_Advanced_Settings/) for adjusting playspace offsets. This is paid on Steam but free on [GitHub](https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings), so you're essentially paying to get auto updates and support the Developers.
- [OVR Toolkit](https://store.steampowered.com/app/1068820/OVR_Toolkit/) for desktop overlay
- [fpsVR](https://store.steampowered.com/app/908520/fpsVR/) for performance monitoring
