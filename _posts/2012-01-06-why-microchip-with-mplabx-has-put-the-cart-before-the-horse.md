---
layout: post
title:  "Why Microchip with MPLABX has put the cart before the horse."
teaser: "I had been a long time user of Microchip parts, and a fan for over ten years. I've owned and built several PIC programmers. An ICD2, an ICU-U64 and all the CCS compilers, several dsPIC devel boards, I even bought an ICD3 just recently because I ..."
thumbnail: "/assets/images/2012-01-06/tmb_MicrochipTechnology_Logo.png"

---
![Microchip](/assets/images/2012-01-06/MicrochipTechnology_Logo.png)
# Update: I received a response from Microchip; see the end.

# The history.

Hello friends, let this tale of woe be a lesson for those deciding on a MCU supplier.

I had been a long time user of Microchip parts, and a fan for over ten years. I've owned and built several PIC programmers. An ICD2, an ICU-U64 and all the CCS compilers, several dsPIC devel boards, I even bought an ICD3 just recently because I wanted get back to my long-held favourite supplier. Even though in the mean time I'd used alternative MCUs from the likes of Atmel, ARM and TI that have better support and open source toolchains.

Let's start with the ICD2. I bought it long ago in the hope that one day I could use it natively under Linux. Back then I really didn't mind having to dual-boot my machine into Windows to use MPLAB IDE because it wasn't too bad to use and I was younger, so jumping through hoops was ok to me back then. I've used that ICD2 extensively, creating many NDA protected projects for many large clients (banks, hospitals, telecommunications companies etc) and I've also used it to create a few open source projects too (like PICStep).

After a while of getting frustrated with Windows, and also discovering how easy it was to use an AVR under Linux I slowly started to move my projects to Atmel. Adding to that the ease and low entry cost to program an AVR. But without dropping serious dollars on a JTAG mkII I never was able to debug like I could with my ICD2. I missed that. And Atmel were awful at supply and their devices didn't have the scope of all the peripherals the PICs had.

# A new beginning... maybe.

Fast forward to Nov 2011 and having used a clients boards with a dsPIC on it, I soon started wondering if Linux support in Microchip-land had gotten any better. Looking around I found MPLABX with the long-awaited Linux support! HUZZAH! I thought. I went home that night and dusted off my ICD2 only to find out later that the ICD2 support would be dropped.

A few days later I received a tweet from Microchip advertising "XMAS Specials" that included a discounted ICD3. Knowing the ICD3 was supported under MPLABX I thought "what the hell", the ICD3 is supposed to be faster anyway, plus it supported PIC32 which would be where I'd be heading soon enough. A few weeks later I had the ICD3 in my hands, and there begins my troubles.

Firstly let me backtrack a little and give you a list of a few niggles I had when I originally installed MPLABX.

MPLABX and all Microchip compilers need root access to install. Don't ask me why other than they want to default install into /opt but <strong>anything</strong> that needs root makes me worry.
MPLABX creates a big fat "MPLABXProjects" in the root of your home directory <strong>every time</strong> it starts. Even if you go and change your preferences and move it to somewhere else, it will still create it.
It bugs you about 'plugins' you can install when updating, which install just fine. They have toolbars and buttons and everything, but dare click on one and a helpful dialog leaps forth and states "This feature only works in Windows".

And they dumped support for ICD2 when they already had the framework working.
"Not to worry" I tell myself, it's only a Beta. It'll get better.

# Feeling like a guinea pig.

As a software engineer by day I fully understand the development process, and I also understand that bugs exist and even the world's best programmer will still make bugs. But MPLABX just feels like it's either written by one guy who is so overworked and underpaid (which if that's the case I salute him/her for their efforts thus far and I take back my criticisms about it being buggy) that simple things are being missed. Or by a committee of marketing people with a big list with "Linux/OSX support" written on a whiteboard somewhere.

My major gripe with MPLABX isn't its bugs or it's niggles. No, it's why it was built/released before a decent set of command line tools were written/released for all platforms. MPLAB IDE was Windows only, sure, great move with the times and go multi-platform. But why is their first response to multi-platform to build an IDE? All their compilers have command line support. Why is it then that the official programmers/debuggers do not. Instead we're bludgeoned with the bulk of a full IDE just to program a few bytes of HEX into a MCU. Look at the Arduino IDE. It uses a bunch of command line tools (avrdude, gcc, make etc) behind the scenes and nobody is the wiser. The hardcore guys can build their own environment the way the like it (vim, emacs, etc) as well and everyone is happy.

Oh but no, not Microchip. The only way to program an MCU with an ICD3 under Linux/OSX is through the hulking mass that is MPLABX. What drives me absolutely crazy is ICD2 Linux support was being screamed about on their forums for almost ten years!

I posted my list of gripes on <code><a href="http://dangerousprototypes.com/2011/12/20/mplab-x-v1-0-released/" target="_blank">dangerousprototypes.com</a></code>. and pretty solidly got support from the posters. Even a Microchip employee popped up and said they have a "mdb.sh" tool in their SDK that allows ICD3 command line programming, but support for it is "really soon now". I've heard that throw away response some ten years ago on their forums about ICD2 support too.

I downloaded the SDK (all 395MB of it) and indeed it can talk to the ICD3, but there is no documentation and it looks only half done. Which leads me back to my original point. Why on earth wasn't this the first thing written?

I posted a thread on their MPLABX forum about my list of issues. Some "guest" hijacked my thread and was dutifully answered by a Microchip employee, yet my questions were ignored. Talk about alienating a customer.

# Quit your bitching and just use the thing okay.

So for the past two weeks I decided I'd just use the IDE and get over it. I installed the C18 compiler (root and all), I set up MPLABX (again trusting Microchip with root), I create a fresh new project, I try to compile.... "Could not generate makefiles for configuration default". WTF!

I look in the forums, apparently if I confirm the C18 compiler was detected correctly and I press 'Apply' the default Makefile will be auto-generated. I've worn out the 'Apply' button on and off over the past two weeks.

I installed PICC18 from HiTech (which doesn't need root by the way) and that seems to work, but all my code is written using header files and pragma's for C18 so I'm loathed to convert it over yet. I can't create my own Makefile because Netbeans doesn't like that, and so I'm just plain stuck. No support from the forums, no native support for my OS, and an ICD3 I've not been able to use without running a VM of WindowsXP and MPLAB IDE (yes I eventually relented and used Virtual Box and USB support).

# Conclusion?

I'm just so frustrated with Microchip now, I feel like my loyalty has been really put down and unnoticed. I'm so tempted to sell all my various parts on eBay for cheap, and become an anti-Microchip zealot.

# Update!.

After being contacted via various means by Microchip some of my points have been answered.

'prj' from Microchips forums answered two of my questions.

#### 1. It needs root to install even if you're installing it in your home dir.

<blockquote>We currently use the Java call "loadLibrary" to access our low-level, USB support library. "loadLibrary" pulls the libraries from the default library path (as defined by java.library.path ) no matter on which OS it may be running. For Windows, this is either \Windows\system32 or \Windows\SysWOW64, and, usually, if not always, on Linux this includes /usr/libs (which is a common location for user libraries per our discussions with many a Linux user). On Linux, our library in turn loads a specific version of libusb using a uniquely named soft link that we create in /usr/local/libs (in this way we do not overwrite any versions of libusb which may be on the user's system).

Both of these locations on Linux normally require root privileges to access. As such, even if MPLAB X itself is installed in your home directory, the low-level, USB support libraries and links are placed in known, system locations. We could, on Linux, per your suggestion, attempt to modify the java.library.path in the script that invokes MPLAB X, however, for multiple installs of different versions of MPLAB X on a single system (which some users may require), this will present a problem (the first entry in java.library.path always "wins").

Admittedly, our current scheme may present some concerns (root access), but precludes some of the "where are you" handling that can become very messy very fast.</blockquote>

#### 2. The 'please reboot for the changes to take effect' msg after you install is quaint and unneeded.

<blockquote>One other reason we need root access is that we place a udev rule file in place to provide USB hot plug support while using libusb (at the time we did this, libusb did not have hot plug support). Udev rules files are placed in /etc/udev/rules.d/, which, again, normally requires root privileges.

As far as the reboot, this was also a sore point with me. Our intention was to install the rules file and then call the appropriate udev facility to "activate" it. However, we found that different distros of Linux use different or customised udev handling. What we found was that on some distros, a reboot is necessary (and required per some docs) for new udev script or rule files to be recognised (because the dynamic facility to load a rules file was not available or simply did not work). Other distros were fine.

But in all distros, a reboot guaranteed that our udev rules file would be recognised (and hence our USB hot plug would work). Again, in Linux, when libusb supplies a solid and true hot plug functionality (including when our devices are cycled "electronically" on and off the bus for update purposes), we will investigate its use and then the udev file may not be necessary.</blockquote>

Both are understandable from a company that's just entering into Linux support with their newly developed software, but in the long-bow view I still think requiring root to install is flawed. I'd rather see the installer allow me to install where I like (eg. my user dir) and have it populate a directory with a shell script that I can inspect/run to install all the root user requirements rather than have them hidden from me. The installer if run as root (for those users who don't care) can install everything as before, but those sensitive to root usage can still install but will need to do a further step to complete the install them themselves. I think that would be a better solution rather than blankly denying install if you aren't root

Also there are ways around fiddling with the base OS. Dumping files into system directories works fine on Windows but I hate having random libraries clogging up my distro years on. I'd rather LD_LIBRARY_PATH or such was modified in a "start-up" script. Or statically compiled binaries, disks are cheap.

The libUSB hot-plug problem I could see being a dicey one, and I fully appreciate the solution they are using is probably the best one at this time. However when libUSB does solidly support hot-plug I'd really like to see this requirement go away. There should hopefully be a point in the future where root is no longer needed at all.
