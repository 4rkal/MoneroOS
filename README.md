# MoneroOS
MoneroOS is a live monero miner inspired by nicehashOS. It is based on <a href="https://archlinux.org">archlinux</a> and uses <a href="https://github.com/laurent85v/archuseriso">archuseriso</a>

# Installation
Download the pre-compiled binaries from the release tab. Then write the .img file to your usb stick. 

On linux check out <a href="https://wiki.archlinux.org/title/USB_flash_installation_medium#Using_basic_command_line_utilities">this</a>

On windows use something like <a href="https://rufus.ie/en/">rufus</a>

After that you will either have to copy your existing xmrig configuration into the mounted partition called COWMOS or create a new configuration here https://xmrig.com/wizard. The configuration should be saved under the name config.json

Now reboot your computer and <a href="https://www.google.com/search?q=boot+from+usb&">boot from the usb </a>
# Compile from source

You will have to be using archlinux

First clone the repo using git:

`git clone https://github.com/4rkal/moneroOS.git`

Then install archuseriso from the <a href="https://aur.archlinux.org/packages/archuseriso">aur</a>

`yay -S archuseriso`

After that run the following command to build the .img file

`sudo aui-mkiso -m 'img' moneroOS/`

When it has finished you should see a new directory called out. Just cd into that and write the .img file to your usb

# TODOS
This is the basic to do list. If you have any other recommendations don't hesitate to create an issue.
- [ ] Companion application
- [ ] More user-friendly guides (windows etc)
- [ ] XmrigCC support
