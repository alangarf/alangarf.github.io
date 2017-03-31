---
layout: post
title:  "SBC servo control under Linux"
teaser: "Using a Single Board Computer running Linux to control a quadrature encoded servo motor."
thumbnail: "http://i3.ytimg.com/vi/tLVsa3-zMqc/mqdefault.jpg"
---

Here is a small update on a project I'm working on for a client.

{% youtube "https://www.youtube.com/watch?v=tLVsa3-zMqc" %}

I've subsequently dropped the split quadrature encoder set up and added another shaft encoder on the actual lead-screw. So now I can actually use a stepper or a servo and I close the control loop using my own shaft encoder. I've still got to put up with the non-realtime kernel but it's a lot better and good enough for what I need.
