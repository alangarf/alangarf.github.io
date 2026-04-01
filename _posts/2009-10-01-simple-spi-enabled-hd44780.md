---
title: "Simple SPI Enabled HD44780"
g1:
    - image_path: assets/images/2009-10-01-CRW_6618.jpg
      url: assets/images/2009-10-01-CRW_6618.jpg
    - image_path: assets/images/2009-10-01-CRW_6616.jpg
      url: assets/images/2009-10-01-CRW_6616.jpg
---

{% include gallery layout="half" id="g1" %}

This is my new SPI enabled LCD display. It uses the same technique used
[here](http://www.scienceprog.com/connect-lcd-to-atmega-using-3-wires/). It
uses a 74HC164 shift register to put bits into a HD44780 LCD in it's 8-bit
mode. This has the advantage of vastly simplified communication (no 4-bit
nibble mode stuff etc) and being SPI only uses three wires (\_Clock, \_Data,
\_Latch). The only slightly non-SPI type thing is the use of the \_Data line to
control the HD44780's register select line (R/S) as well as the shift registers
data input. This allows the bits to be clocked into the shift register via the
\_Clock and \_Data pins, then you can leave the \_Data line either high or low
after clocking depending on the register you want in the HD44780 then you pulse
the \_Latch. The HD44780 loads the 8-bit data into the appropriate register and
all is good! The HD44780 does see some bit twiddling as the bits are loaded
into the shift register but it will ignore them until the \_Latch is pulsed
anyway.

I've semi-standardised on my 6-pin header now, both my 7 segment SPI display
and this display have compatible connectors. The LCD doesn't require the
display enable line that the 7 segment display has, but it could have been used
to control the back-light if the LCD I used had one! :)

I'm going to mount this little do-dad in a nice little custom box when I
get some time to put some plastic into the CNC machine at Tyson's. It's
really nice to get a bunch of little helpful devices like this on your
bench to debug things without resorting to breakpoints and stepping
through code.

Once again I used the point-to-point technique. I'm really starting to
like this method of assembly, I can see why
[ChaN](http://elm-chan.org/) uses it for all his
little awesome do-dads. I have some Kapton tape now so I'm looking
forward to flexing my skills with a few QFP or small SOIC devices soon!
