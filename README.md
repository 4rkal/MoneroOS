# MoneroOS
MoneroOS is a live monero miner inspired by nicehashOS. It is based on archlinux and uses archiso.

# Installation
(On linux)

Download the pre-compiled binaries from the release page.

After that write it to your usb drive. You can use gnome disks for that or by using dd. See https://wiki.archlinux.org/title/USB_flash_installation_medium

Now create a new partition from the rest of the free space. In gnome disks just select your usb > select Free Space > click on the + sign > select any amount of GB > Then click next > Select any name > then under the type select FAT > click on create > Finally mount the usb

Now over at the newly created partition you can either paste your existing config.json from xmrig or use xmrigs configuration wizard https://xmrig.com/wizard

And thats about it now just unmount your usb and restart your computer and boot to your usb.

# TODOS
This is the basic to do list. If you have any other recommendations don't hesitate to create an issue.
- [ ] Companion application
- [ ] More user-friendly guides (windows etc)
- [ ] XmrigCC support






