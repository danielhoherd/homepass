[![Join the chat at https://gitter.im/danielhoherd/homepass](https://badges.gitter.im/danielhoherd/homepass.svg)](https://gitter.im/danielhoherd/homepass?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Purpose

This repo is meant to unify a lot of the fragmented Nintendo 3DS Homepass resources. Primarily it is host of a large list of Homepass Access Points, but contains additional software resources.

Please fork this repo, modify it and submit a pull request if you want to add to it. If you're not sure what this means, it's easier than you think! Create a Github account, navigate to this repository, find the file you want to edit and click "edit this file", then step through the screens.

# TODO:

- Make a csv tender that validates, removes duplicate MAC,SSID pairs, and adds `NZ@McD1` for all `attwifi` entries

# Resources

- [Homepass.info](http://homepass.info) - The widely referenced community resource spreadsheet.
- [SpillPass Pi](http://www.spillmonkey.com/?page_id=5) - Raspberry Pi homepass that was inspirational for some of the software here.
- [relaymyhome](https://github.com/taintedzodiac/relaymyhome) - OS X homepass software that has worked well for several years and has several contributors with several forks.
- [3dbrew.org](http://3dbrew.org) - Wiki with information about 3DS hacking, including homepass.
- [3dbrew - Nintendo Zone](http://3dbrew.org/wiki/Nintendo_Zone) - 3dbrew info about Nintendo Zones

# Observations about Streetpass Relay

- Your 3DS has a list of whitelisted SSIDs that it will connect to.
- When a whitelisted SSID is in range, your 3DS tries to connect to it.
- If it connects to the wifi, it then tries to connect to the internet, specifically Nintendo's streetpass servers.
- If it connects to the streetpass servers, any streetpass data for games that you have enabled for streetpass is uploaded, and the payload is tagged with the SSID and MAC Address of the WiFi AP that you are connected to.
- The uploaded data is copied, not moved, so if you relay many APs consecutively, you will upload the same data to all of them.
- At the same time, data for a random selection of data uploaded by people who have recently connected to this same SSID/MAC pair is returned to your 3DS. The time period for selection has been observed to go back as far as a month.
- The view of the data is solely from the perspective of the 3DS, it is not a two-way sync. You can streetpass somebody a million times without them ever streetpassing you.
- This process appears to not be limited by anything other than the SSID/MAC pair. This means you can simply make up MAC addresses to use for any valid whitelisted SSID, and you can also spoof SSID/MAC pairs that you have seen "in the wild".
- There does not appear to be any distinction between "genuine" relays, and "spoofed" relays. (This is likely because it would be an administrative nightmare for Nintendo to track all of the wifi gear their partners were installing, so I suspect it will always be this way.)
- Because it is possible to spoof SSID/MAC pairs you've seen in-the-wild, if you add your Best Buy info to the maclist.csv, you will begin to see the people who are homepassing it when you go to the authentic relay, and they will see you if you streetpass there. In fact, this is characteristic can be very advantageous for filling in geographical regions, gettting a diverse set of guests, or getting people from far away (eg: for Pokémiles)
