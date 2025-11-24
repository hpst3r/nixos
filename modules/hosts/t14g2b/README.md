# T14 G2 #2

ThinkPad T14 Gen 2 AMD (number 2 - actually my first one, though it doesn't matter)

- R7 5850U (8c 16t)
- 48gb (16gb soldered + 32gb SODIMM) DDR4 3200
- 1tb Intel SSD 670P

Root on (natively encrypted) ZFS.

Currently using as a copy of t14g2a for testing. Intend to use both as servers eventually, but all my nicer laptops don't work right.

```txt
[wporter@t14g2b:~]$ nix run nixpkgs#fastfetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             wporter@t14g2b
          ▜███▙       ▜███▙  ▟███▛             --------------
           ▜███▙       ▜███▙▟███▛              OS: NixOS 25.05 (Warbler) x86_64
            ▜███▙       ▜██████▛               Host: 20XLS1M700 (ThinkPad T14 Gen 2a)
     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: Linux 6.12.55
    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 31 mins
           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 1158 (nix-system)
          ▟███▛             ▜██▛ ▟███▛         Shell: bash 5.2.37
         ▟███▛               ▜▛ ▟███▛          Display (LEN P27u-10): 3840x2160 @ 60 Hz (as 2560x1440) in 27" [External]
▟███████████▛                  ▟██████████▙    DE: GNOME 48.2
▜██████████▛                  ▟███████████▛    WM: Mutter (Wayland)
      ▟███▛ ▟▙               ▟███▛             WM Theme: Adwaita
     ▟███▛ ▟██▙             ▟███▛              Theme: Adwaita [GTK2/3/4]
    ▟███▛  ▜███▙           ▝▀▀▀▀               Icons: Adwaita [GTK2/3/4]
    ▜██▛    ▜███▙ ▜██████████████████▛         Font: Adwaita Sans (11pt) [GTK2/3/4]
     ▜▛     ▟████▙ ▜████████████████▛          Cursor: Adwaita (24px)
           ▟██████▙       ▜███▙                Terminal: GNOME Console 48.0.1
          ▟███▛▜███▙       ▜███▙               Terminal Font: Adwaita Mono (11pt)
         ▟███▛  ▜███▙       ▜███▙              CPU: AMD Ryzen 7 PRO 5850U (16) @ 4.51 GHz
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              GPU: AMD Radeon Vega Series / Radeon Vega Mobile Series [Integrated]
                                               Memory: 3.99 GiB / 45.89 GiB (9%)
                                               Swap: Disabled
                                               Disk (/): 2.38 MiB / 852.02 GiB (0%) - zfs
                                               Local IP (enp5s0): 192.168.77.169/24
                                               Locale: en_US.UTF-8

```
