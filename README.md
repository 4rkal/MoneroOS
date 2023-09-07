# MoneroOS

MoneroOS is a live OS designed to easily begin mining <a href="getmonero.org">Monero</a> upon boot with only minimal configuration. It is inspired by <a href="https://www.nicehash.com/nhos-mining">NiceHash OS</a> and is based on <a href="https://archlinux.org">Arch Linux</a>, created using <a href="https://github.com/laurent85v/archuseriso">archuseriso</a>.

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

## P2Pool
If you want to use p2pool please check [this](https://github.com/4rkal/MoneroOS/wiki/P2Pool) wiki entry.

## TODO
This is a basic TODO list. If you have any recommendations please don't hesitate to create a GitHub issue.
- [ ] More user-friendly guides (Windows, etc.)
- [ ] <a href="https://github.com/Bendr0id/xmrigCC">XMRigCC</a> support
- [x] <a href="https://p2pool.io/#pool">P2Pool</a> / <a href="https://p2pool.io/mini/#pool">P2Pool-Mini</a> support and/or instructions
- [ ] Automatic updates for p2pool 

## Support/Feedback
If you need assistance with anything or want to leave some feedback, here are the ways you can get in touch with with me:
- Public matrix room `#moneroOS:matrix.org`
- Email `4rkal@proton.me`

If you would like to support MoneroOS development you can send some monero to the bellow address. Any contributions are greatly appreciated!

`84ACcLqyu1b77k5CNgW46q1Mha7q6Qc99421H6M5cxhX3pGuxvJ2HSncu9NyfkcE46edUzwhPsTCwGRiAEhXRmyg6Lu3SUb`
