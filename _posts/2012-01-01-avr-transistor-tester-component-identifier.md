---
title:  "AVR Transistor Tester / Component Identifier"
teaser: "Using a Single Board Computer running Linux to control a quadrature encoded servo motor."
thumbnail: "//i3.ytimg.com/vi/PRjM9Kkg-xM/mqdefault.jpg"

---

# Ooh a gadget.

While browsing <a href="http://dangerousprototypes.com/">dangerousprototypes.com</a>. I saw an interesting little gadget by Mark Frejek at <a href="http://www.mikrocontroller.net/articles/AVR-Transistortester">www.mikrocontroller.net</a>. Mark had made a transistor and component identifier using an AVR ATMEGA8, a few resistors and a 16x2 LCD. Always wanting one of those expensive Atlas testers I was intrigued.

I saw a few examples of people building the circuit on the net and the operation of the gadget seemed to be really well done. The software seemed very polished and comparable to the Atlas devices that I've only seen in person at trade shows. Also, having all the required parts in my bins and the long standing niggle in the back of my brain telling me to try and find a use for that ATMEGA8 DIP uC I've had floating around for a while, it was almost a match made in heaven.

# The lucky find.

Like all really good projects I've done in the past, I find that after prototyping if I start by designing the case and PCB shape first I'm set up for fewer nasty surprises later. Because this is a fairly simple circuit (relatively) and I'd seen plenty of examples of it working I didn't feel I needed to breadboard or prototype the design first.

My mate Tyson gave me a bunch of really nice NKK illuminated panel switches. They're from broadcast video equipment I think. They're really gorgeous. Having a large number of them at hand I thought it would be nice to use one on this too.

The lucky find was the case. I happened upon a special at <a href="rockby.com.au">rockby.com.au</a>. for a pair of <a href="http://www.hammondmfg.com/dwg6p.htm">Hammond 1599BSGY</a>. cases for $7. Knowing how good Hammond cases are I grabbed a pair.

I needed to fit in a 9V battery, the LCD, the button and the testing header. I wasn't going to make a custom PCB for this project because I knew I was only going to make the one, so I used point-to-point technique on double-sided doughnut board.

The front of the case has a nice recess that is designed for an inlay, so having some 1.5mm IPI black on white signage plastic kicking around I set to work on CNC'ing a front panel.

# Let's CNC.

Opening VCarve Pro I soon had a basic idea of the layout I wanted. Fairly simple, two openings, a bit of text and done. I first trimmed up a piece of PCB to fit inside the case with a 9v battery and layed the LCD and switch in positions that was pleasing. I took some measurements and moved the openings they required into position. Added a nice round border, some helpful numbers a bit of a title. Done, time to machine.

I've done so much on this little CNC machine now that it really doesn't take very long to get things set up. Having decent hold-downs and pre-cut sacrificial pieces of MDF really help. Within about 10 minutes I had the front panel all done!

# Time to solder!

I wanted to socket the LCD so I could remove it later if I wanted to recycle this project in the future. You just never know, I might not use it all that often in the future so why waste it? This was an inspired idea not for the reasons above; more on that later.

I have these round machine pins which match up with standard machine pin socket strips. I originally bought them to use on PCB to breadboard adapters as square 0.1" pins ruin breadboards. Whereas these are small round IC type pins and work fine. So, I soldered the pins on the PCB and the socket on the LCD. The LCD is spaced off the PCB by the height of the socket and a small block of foam, the pins are practically flush with the PCB. This gave the LCD a perfect flush finish with the front panel when the PCB was screwed down to the stand-offs on the rear of the case.

The NKK switch was "surface mounted" on the PCB because I wanted it to be flush with the front panel also, and it allowed some movement in it's positioning to match the opening I had cut.

The ATMEGA8 was socketed (so I could program it / recycle later) and the rest of the components were standard 0805 resistors/caps and TO92s. All the wiring and components apart from the TO92 were put on the underside of the board. I added a 2 pin socket for the battery snap because I hate wire to PCB connections and also so I could recycle it too in the future (did I have faith in this project of what! :).

# Program, test and done. Or so I thought!

I found my Bus Pirate, plugged the ATMEGA8 into a breadboard, hooked up the leads, loaded up avrdude to load the firmware, plugged the uC into it's socket, powered up the tester and pressed the button... random garbage appears on the LCD, then it cleared and then it did it again. DOH!

At this point I won't bore you with the many hours and the trials I went through to discover the simple missed step that made the problem go away. Suffice to say I checked all the lines between the LCD and the uC, I probed, I scoped, I blew up my RS232 TTL to USB adapter, I even modified the code and added debug. All to no avail

Reading through the source code with it's German comments I made a discovery with my rusty high school German that was so head slappingly obvious that I still hang my head in shame a little. I hadn't programmed the EEPROM of the ATMEGA with the LCD strings it was trying to show. <strong>DOH!</strong>

So after doing that it sprung to life!

# Problems with the LCD part 2.

Wanting the LCD backlight and the NKK switch's LED to light when the tester was on seemed a simple task. A pair of drop resistors with the LEDs across 5V and GND, done! Well for the switch that was the case. But for some reason the brand new LCD I had purchased years before had a busted LED backlight. DOH! I'm so glad I socketed the LCD now!

I probed the backlight on the LCD and it was just dead, open circuit dead. I pulled the LCD apart and the backlight was a module filled with small chip LEDs and a transparent trough. I could see no physical damage or signs that I could repair it.

Wanting to bodge something till I could buy a replacement I though about fitting my own LEDs inside this backlit trough to get me by. So I started cutting down some 5mm green LEDs I had. It's a really fun game to see how close you can cut the LED down before it stops working. I managed to get two down to ridiculously thin while only sacrificing a single LED in their making.

I cut two notches in the sides of the trough, hot-glued in the LEDs and also ran a bead of hot-glue down the center between the LEDs to help disperse the light a bit more. Doing this seemed to work a treat! After assembling everything again it looked great! It's still not as bright as the default backlight, but it's better than nothing.

# Video time!

To explain more about it's construction and show it in operation with a few components I recorded a basic video.

{% youtube "http://www.youtube.com/watch?v=PRjM9Kkg-xM" %}

# Conclusion

 All in all I'm very happy with this little do-dad, it'll be really really handy in sorting out the grab-bags of transistors/FETs/JFETs/TRIACS/Diodes I have floating around. I'm pretty proud of the construction and I'm very pleased to add it to my standard bench tools. I don't think it will get recycled any time soon!
