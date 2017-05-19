---
title: More fun with the m68k
excerpt: "Finally I achieved my goal of getting a Mandelbrot routine running on this m68k board and I learned a lot along the way"
header:
  overlay_image: "/assets/images/2017-04-18/mc68340.jpg"
  overlay_filter: rgba(32, 62, 91, 0.8)
  teaser: "/assets/images/2017-04-18/mc68340.jpg"

---

# The last days of the Retro Challenge

The Retro Challenge behind me, and not actually achieving my goal I was pretty
disappointed that work/life commitments stacked against me in getting there.
That didn't stop me from completing my goal, just wasn't in the time frame of
the competition.

Where I left off lasted I had my bootloader working and a basic assembler
environment working, but I wanted a high level language to create my Mandelbrot
set. I didn't want to write it in assembler.

# The first steps

I got the idea that since I had a linker script, etc setup it wouldn't be a
long stretch to get GCC and libc working. So I set out to do just that.

After a few nights fiddling around and hitting a bug in the version of GCC and
libc where the compiler would crash because I was missing a linker directive,
but even when fixed the compiler would still bomb. After much research it
seemed to be a bug that I really wasn't in the mood to research and fix, or to
update the environment. Also the output I got was really large and inefficient,
so I started looking for an alternative.

# Enter crosstool-ng

Not looking forward to the prospect of compiling GCC and all the rest manually
I started looking for tool-chains I could get that wouldn't require a lot of
fiddly setup, another thing is that a lot of m68k is getting long in the tooth
and the tool-chains and tools are deteriorating at an alarming rate. After a few
nights looking around I stumbled upon
(crosstool-ng)[http://crosstool-ng.github.io/].

An unassuming utility that builds tool-chains for various processors and setups,
one of which is m68k based systems. During my search for a new tool-chain I also
stumbled upon Newlib, a libc alternative that is much lighter than standard
libc and has abstracted I/O functions out to basically eight system calls.  

After about 20 minutes with crosstool-ng I had a new Newlib based tool-chain
ready. Here are the basic steps I took to build the tool-chain:

```shell
# Get the latest crosstool-ng
$ git clone https://github.com/crosstool-ng/crosstool-ng
$ cd crosstool-ng
$ ./bootstrap

# Build the crosstool-ng
$ ./configure --prefix=/opt/crosstool-ng
$ make
$ make install
$ export PATH="${PATH}:/opt/crosstool-ng/bin"
```

```shell
# Make a working dir
$ mkdir work-dir
$ cd work-dir

# I used the m68k-unknown-elf "sample" as it had all I needed
$ ct-ng m68k-unknown-elf
$ ct-ng menuconfig
$ ct-ng build
```

After a little while you'll end up with a `x-tools` directory with all the
tools you need!

# Time to test the compiler

I made a simple project that simply setup the UART and output "Hello world",
the linker was setup to operate purely from RAM so the `.data` didn't need to
be copied and the `.bss` was already cleared. I needed to implement the basic
functions that Newlib mandates :

```c
int close (int fd);
int fstat (int fd, struct stat *buf);
int getpid();
int isatty (int fd);
int kill (int pid, int sig);
off_t lseek (int fd, off_t offset, int whence);
int open (const char *buf, int flags, int mode);
void print (char *ptr);
void putnum (unsigned int num);
void *sbrk (int nbytes);
int stat (const char *path, struct stat *buf);
int unlink (char * path);
int write (int fd, char *buf, int nbytes);
```

You don't need to implement all these functions, initially I just implemented
each one I needed as the compiler complained. I found for a simple UART output
I only needed four.

It compiled just fine and when I copy and pasted the srec data into my bootload
I was happily presented with a "Hello world!"

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">F%^&amp; YEAH! gcc and Newlib work! This is a `printf()` compiled with GCC output as srecord data and pasted into my bootloader. WORKED! YAY! <a href="https://t.co/PpjcL73qq1">pic.twitter.com/PpjcL73qq1</a></p>&mdash; Alan Garfield (@alangarf) <a href="https://twitter.com/alangarf/status/861920638922924032">May 9, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Suffice to say I was pretty damn happy

# Mandelbrot now?

Even though I now was ready to build a Mandelbrot set I was still unhappy with the
fact my init code and the required Newlib system calls weren't implemented that
well. Plus I had a bug I noticed where the CPU would crash if I called too many
subroutines. This last one was pretty easy to fix but it did require me to
clean up my linker script and create something more complete. The issue with
the crash was my heap space and stack space was colliding. I was artificially
reducing the heap space to make the upload to the board smaller. I was having
race conditions in the silly terminal I was using that was causing my
bootloader to miss characters etc.

So, rather than make a Mandelbrot I set about to build a "BSP" (Board Support
Package) for this board.

# An AMX AXC-EM BSP

To start with this seemed like it would be much harder until I found the source
for Newlib itself, and the `libgloss` library. Inside the source for the `m68k`
in `libgloss` it had implementations of BSPs for other m68k based boards.

Using the details of a few of these boards I was able to piece together what
was required to make a BSP for this board. With a little bit of testing and
poking around I managed to make a support library that made compiling things
for this board almost trivial!

I've pushed this BSP to github: (AMX AXC-EM BSP)[https://github.com/alangarf/axc-em-bsp]

To use it all you need to do is point the linker of your project to  the
resulting `libamx.a` and use the linker script for linking and you project
should just work.

I'm slowly adding more details for the peripherals of the MC68340 as I go, but
so far it has what is needed for the UART.

# Now a Mandelbrot?

You bet. Being lazy I looked around on github.com for a C-based ASCII
Mandelbrot routine. The first one I found seemed simple, but turned out to be
extremely inefficient. I build and tested it on the board, but initially I
thought the board crashed. Just luckily I left it running and after a few
minutes a single line of a Mandelbrot had been output.

Leaving it for another 20 minutes only another 5 lines where added. Thinking
that the CPU had slipped out of it's 16MHz clock mode I reconfirmed that the
clock was at the right speed. It was just very inefficient code.

Looking for another source of laziness I found
[asciibrot](https://github.com/vain/asciibrot/blob/master/asciibrot.c). It was
designed to do animation etc, but really all I wanted was a single rendering of
a Mandelbrot. So I tore the routines apart and finally got myself this output:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Yay I finally achieved my <a href="https://twitter.com/retrochallenge">@retrochallenge</a> goal. I can render a mandelbrot set written in C on this m68k board! Better late than never. :D <a href="https://t.co/wDoZAdDz2H">pic.twitter.com/wDoZAdDz2H</a></p>&mdash; Alan Garfield (@alangarf) <a href="https://twitter.com/alangarf/status/864813565282205696">May 17, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Gosh I was so happy when I finally saw that. Over a month on and off mucking
around with this and finally achieved my goal, plus along the way I learned so
much more (and relearned a bunch of stuff I'd long forgotten). It was an awesome
challenge and also the biggest possible reward of entering the Retro Challenge
itself.

# Any more examples?

Here is a real-time display of the board rendering a larger Mandelbrot set.

{% include i src="mandelbrot.gif" nolink="true" %}

An here is a better example showing the actual CPU speed by character. I
removed the line buffering so each character can be seen as it is rendered.

{% include i src="mandelbrot-2.gif" nolink="true" %}

So now I have a really good tool-chain, a working linker script and can
basically compile anything I like. I think the next test is to get the on board
I/O devices sorted out (eg. the clock/calendar, the DIP switches and the I/O
pins I've found) and make it do something more fun. A clock? A vector display
controller with some ADCs? You'll have to wait and see.


