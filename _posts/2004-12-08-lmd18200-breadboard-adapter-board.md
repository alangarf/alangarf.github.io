---
layout: page

subheadline: "Handy Breadboard Adapter"
title: "LMD18200 Breadboard Adapter Board"
teaser: "This is a small PCB designed to allow a TO220 packaged LMD18200 to be used easily on a normal solder-less breadboard."
image:
    thumb: "/images/lmd18200_board.jpg"

gallery:
    - image_url: images/lmd18200_board.jpg
    - image_url: images/lmd18200_board1.jpg
    - image_url: images/lmd18200_adapter.png
    - image_url: images/lmd18200_driver_schema.png
---

I designed this board out of necessity. I needed a decent H-bridge to
test my new servo motor controller design without having to commit the
entire design to PCB before I could test it.

The adapter board uses a single LMD18200 which is a very capable
H-Bridge driver. The LMD18200 can handle continuous loads of up to 3
amps (with adequate heat sinking; which can be attached easily without
over hanging the breadboard!) and voltages up to 55V. It provides 3
input lines (PWM, Direction, Brake) and 2 return signals (Current Sense
and Thermal Overload) for all your micro controller needs. It has a
separate power rail to provide the LMD18200 with the greater than 12V it
needs to turn on it's FET's.

All in all I think it's a pretty handy little board for any sort of load
switching type operation (lighting, motors, whatever) from a breadboard.

**Source Files:** 
Available at <https://github.com/alangarf/lmd18200_breakout>{:target="_blank"}
