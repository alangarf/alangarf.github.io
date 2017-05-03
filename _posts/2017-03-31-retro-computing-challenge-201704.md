---
title: Retro Challenge 2017/04
thumbnail: "/assets/images/2017-03-31/m68k.png"

---

After working with a friend on a Z80 based project I spoke about some SCC2691
UARTs I had from an old board I had saved from a skip bin some 10 years ago. He
asked questions about the board and I described it to him..

> "Yeah it's got a 68000 on it, with what looks like 64KBs of RAM and I don't
> know 32KB or ROM. Looks like there is a clock chip, dual batteries probably
> for the clock maybe the RAM, and what looks like a standard RS232 port."

He quickly said I'd be nuts to tear the board apart and it would make a good
candidate for the RetroChallenge competition. So after very little thought I
considered this as something that might be fun to do. So of course...

[![AMX AXC 68000
Board](/assets/images/2017-03-31/tmb_amx_axc_master.png)](/assets/images/2017-03-31/amx_axc_master.png)


## Retrochallenge

My already busy life schedule has just gotten busier for the next month. I have
successfully entered the 2017/04 challenge and intend to set to work on the 1st
of April.

My goals for this project are:

- Reverse engineer the board.
  - Work out the memory map and the devices and peripherals on the board.
  - Build enough schematic of the board to understand all the little trick it
    might hold.

- Build a software simulator for the board using [a m68k simulator CPU](https://github.com/kstenerud/Musashi).
  - This will include getting the boards own firmware running.
  - Setup a ROM monitor.

- Get a ROM monitor going on the board.
  - Get the onboard the devices working (calendar, UARTs, LED).
  - Get either BASIC or a FORTH interpreter working.
  - Write a Mandelbrot set program.


I'd like to see what can be done with the battery backed up RAM. Perhaps
getting a small OS running would be interesting. Adding additional hardware
will be difficult as there is no "bus expansion" onboard so any additional
hardware would have to sit ontop of the board and replace the RAM or something
to access the address and data lines. But that's not really going to be part of
the challenge. Just getting a ROM monitor etc will be hard enough. :)


