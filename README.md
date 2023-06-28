# MoneroOS

MoneroOS is a live OS designed to easily begin mining <a href="getmonero.org">Monero</a> upon boot with only minimal configuration. It is inspired by <a href="https://www.nicehash.com/nhos-mining">NiceHash OS</a> and is based on <a href="https://archlinux.org">Arch Linux</a>, created using <a href="https://github.com/laurent85v/archuseriso">archuseriso</a>.

## Installation and Configuration

 1. Download the pre-compiled `.img` file from the Github `Releases` section (located to the right of this README on this page). 
 2. Write the `.img` file to your bootable media (USB Stick, portable hard drive, etc.). See the [Bootable Media Creation Resources Per OS](#bootable-media-creation-resources-per-os) section for links to resources for the OS that you'll be attempting to flash *from*.
 3. Shutdown your system and reboot into MoneroOS using your removable media.
    - ***Note:*** While the exact instructions vary from system to system, this is generally done by pressing either _F8, F9, F10,_ or _F11_ directly after you power on your system. If none of these work, use your preferred search engine to find out how to boot from USB on your specific system.  
 5. Create a new XMRig configuration file using the <a href="https://xmrig.com/wizard">Configuration Wizard</a> or use your existing configuration file, copying either into the mounted partition labeled `COWMOS`. Note that this configuration file must be named `config.json`. 

### Bootable Media Creation Resources Per OS

While full step-by-step instructions to create bootable media out of the MoneroOS `.img` file are outside of the scope of this README at this time, resources are linked below for your convenience. Once you have chosen a given method or program for the OS you'll be writing MoneroOS *from*, either follow the documentation they provide, or use your preferred search engine to search for more detailed instructions.  

 - Linux: <a href="https://wiki.archlinux.org/title/USB_flash_installation_medium#Using_basic_command_line_utilities">USB flash installation medium (ArchWiki)</a>, <a href="https://unetbootin.github.io/">UNetbootin</a>, <a href="https://www.ventoy.net/en/index.html">VenToy</a>, <a href="https://github.com/mbusb/multibootusb">multibootusb</a>, <a href="https://etcher.balena.io/">balenaEtcher</a>
 - Windows: <a href="https://unetbootin.github.io/">UNetbootin</a>, <a href="https://rufus.ie/en/">Rufus</a>, <a href="https://www.ventoy.net/en/index.html">VenToy</a>, <a href="https://github.com/mbusb/multibootusb">multibootusb</a>, <a href="https://etcher.balena.io/">balenaEtcher</a>
 - Mac: <a href="https://unetbootin.github.io/">UNetbootin</a>, <a href="https://etcher.balena.io/">balenaEtcher</a>
   - ***Note:*** While it may be possible to create bootable media using a Mac with the M1 or M2 chip, MoneroOS will ***not*** be able to run on systems with either of these chips due to architecture limitations. 

## Compile your own `.img` file from source

  ***Note:*** This must be done from a pre-existing installation of Arch Linux.

1. Clone this repository using Git:

    - `git clone https://github.com/4rkal/moneroOS.git`

2. Install archuseriso from the <a href="https://aur.archlinux.org/packages/archuseriso">Arch User Repository (AUR)</a>:

    - `yay -S archuseriso`

3. Once archuseriso is installed, use the following command to build the `.img` file:

    - `sudo aui-mkiso -m 'img' moneroOS/`

4. When complete you should see a new directory displayed. Use `cd` to navigate into that new directory where you should find the newly generated `.img` file. 

5. Follow the directions within the above [Installation & Configuration](#installation-and-configuration) section to use your newly generated `.img` file. 

## TODO
This is a basic TODO list. If you have any recommendations please don't hesitate to create a GitHub issue.
- [ ] More user-friendly guides (Windows, etc.)
- [x] <a href="https://github.com/Bendr0id/xmrigCC">XMRigCC</a> support
- [ ] <a href="https://p2pool.io/#pool">P2Pool</a> / <a href="https://p2pool.io/mini/#pool">P2Pool-Mini</a> support and/or instructions
