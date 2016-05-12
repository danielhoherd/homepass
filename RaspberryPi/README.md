# Overview

This software is intended for use on a Raspberry Pi using Raspbian 7. When installed correctly, your Pi will start up and immediately begin Homepassing.

# Status

This software currently requires manual installation. Once installed, it functions perfectly, and there are no known bugs.

You **must** add your 3DS MAC address to the <accept> file in order for this to work with your 3DS.

# Difficulties

The hardest part about homepassing on Linux, and thus Raspbian, is finding a wifi adapter that supports hostapd, and enables you to change your MAC address. Unfortunately it's quite common to find an adapter that does one and not the other. There are a few verified working adapters listed on the [Homepass.info Hardware tab](https://docs.google.com/a/zoosk.com/spreadsheet/lv?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE&f=true&noheader=true&gid=2), and I have had luck with two of them. Unfortunately some manufacturers have swapped the chipset of their devices, so buying a particular model doesn't guarantee you a working chipset.

## Known good wifi chipsets:

- rt2800
- rt5370

# TODO:

- Make an installer for this software, Ansible or Puppet.
- Add iptables rules that restrict wifi traffic to Nintendo internet addresses.
- Make [hostapd](https://w1.fi/hostapd/) match substring of MAC address rather than full strings.

# About

Much of the design for this setup was inspired by [SpillPass](http://www.spillmonkey.com/?page_id=5), which works wonderfully on the Raspberry Pi B, but unfortunately in my experience it does not on the B+ or 2.  With that in mind I decided to improve and expand on its techniques.

# Links

- <http://www.jenssegers.be/blog/43/Realtek-RTL8188-based-access-point-on-Raspberry-Pi>
- <https://w1.fi/hostapd/>
- <http://elinux.org/RPI-Wireless-Hotspot>
- <http://www.daveconroy.com/turn-your-raspberry-pi-into-a-wifi-hotspot-with-edimax-nano-usb-ew-7811un-rtl8188cus-chipset/>
