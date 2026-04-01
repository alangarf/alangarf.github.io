---
title: Getting STLink-V3 and Pico Probe working in Arch Linux
excerpt: "for the brain file"
---

# How?

Two rules, one for STLink-V3 and one for Pico Probe.

```shell
# STLink V3 (0483:3753) - Main Serial Port (VCP Data)
SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3753", ENV{ID_USB_INTERFACE_NUM}=="01", SYMLINK+="stlink_v3_main", TAG+="uaccess"

# STLink V3 (0483:3753) - Bridge Serial Port (VCP2 Data)
SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3753", ENV{ID_USB_INTERFACE_NUM}=="04", SYMLINK+="stlink_v3_bridge", TAG+="uaccess"

# STLink V3 (0483:3753) - Debug Interface (For probe-rs / OpenOCD)
SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3753", ENV{ID_USB_INTERFACE_NUM}=="00", TAG+="uaccess"
```


```
# Raspberry Pi Pico (RP2040) BOOTSEL
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="0003", TAG+="uaccess"

# Raspberry Pi Pico 2 (RP2350) BOOTSEL
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000f", TAG+="uaccess"

# Raspberry Pi Pico (RP2040) USB Serial
SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000a", TAG+="uaccess"

# Raspberry Pi Debug Probe - UART Serial Port
KERNEL=="ttyACM*", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="000c", ATTRS{serial}=="E663AC91D3480E30", ENV{ID_USB_INTERFACE_NUM}=="01", SYMLINK+="pico_debug_uart", TAG+="uaccess"
```


Install in `/etc/udev/rules.d/`, call em whatever.

```shell
sudo udevadm control --reload-rules && sudo udevadm trigger
```

Check with probe-rs:

```shell
❯ probe-rs list
The following debug probes were found:
[0]: Debug Probe (CMSIS-DAP) -- 2e8a:000c-0:E663AC91D3480E30 (CMSIS-DAP)
[1]: STLink V3 -- 0483:3753:0027003C3038511834333935 (ST-LINK)
```

Happy happy days!
