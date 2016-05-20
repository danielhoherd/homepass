# Overview

This software is intended for use on a Raspberry Pi 3 using Raspbian 8. After installation, your Pi will start up and immediately begin Homepassing. Your Pi will be configured to automatically perform software checks once an hour and update your Pi with any changes posted to the Github repository. This is mostly for bugfixes and udpates to the database.

# Installation

1. Install Raspbian 8 onto a Pi 3 (or supported hardware)
2. `wget https://raw.githubusercontent.com/danielhoherd/homepass/master/RaspberryPi/setup.sh`
3. `sudo bash setup.sh`

# Status

You **must** add your 3DS MAC address to the <accept> file in order for this to work with your 3DS. This requirement will stay until there is a way to add substring matching against MAC addresses, which may never happen, or until we have iptables rules that limit traffic to only Nintendo servers. This is a security requirement and prevents passers by from accessing your home network.

# About homepassing on Raspberry Pi

Much of the design for this setup was inspired by the original [SpillPass](http://www.spillmonkey.com/?page_id=5), which works wonderfully on the Raspberry Pi B, but unfortunately in my experience it does not on the B+ or 2. With that in mind I decided to improve and expand on its techniques. Since then, SpillPass has been updated with a much improved overall design, so it is also worth checking out for your use case.

# Difficulties with homepassing on Raspberry Pi

The Raspberry Pi 3 has solved some of the difficulties listed below, but for other models of Raspberry Pi they still apply. The important factor is to find a wireless device that uses the nl80211 and has the ability to alter its MAC address.

The hardest part about homepassing on Linux, and thus Raspbian, is finding a wifi adapter that supports hostapd, and enables you to change your MAC address. Unfortunately it's quite common to find an adapter that does one and not the other. There are a few verified working adapters listed on the [Homepass.info](http://homepass.info) Hardware tab, and I have had luck with two of them. Unfortunately some manufacturers have swapped the chipset of their devices, so buying a particular model doesn't guarantee you a working chipset.

## Known good wifi chipsets:

- rt2800
- rt5370

# TODO:

- P1: Fix random/uknown reboot condition
- P1: on service start, update git prior to starting homepass.sh
- P1: when git code is updated, restart homepass service
- P1: when git code is updated, update the database
- P2: make a second ethernet interface for uninterrupted local network access
- P2: prioritize selection of community relay MACs from homepass.info list
- P2: logging of client connections, ssid info
- P2: wait for boot to complete before starting homepass service
- P3: detect terminal size and format output nicely within
- P3: Add iptables rules that restrict wifi traffic to Nintendo internet addresses.
- P3: randomize wifi channel
- P4: Make [hostapd](https://w1.fi/hostapd/) match substring of MAC address rather than full strings.

# Links

- <http://www.jenssegers.be/blog/43/Realtek-RTL8188-based-access-point-on-Raspberry-Pi>
- <https://w1.fi/hostapd/>
- <http://elinux.org/RPI-Wireless-Hotspot>
- <http://www.daveconroy.com/turn-your-raspberry-pi-into-a-wifi-hotspot-with-edimax-nano-usb-ew-7811un-rtl8188cus-chipset/>
