
# T14 G2 #1

ThinkPad T14 Gen 2 AMD

- R7 5850U (8c16t)
- 48gb (16gb soldered + 32gb SODIMM) DDR4 3200
- 1tb Intel SSD 670P (boot, swap, rpool)

Root on (natively encrypted) ZFS.

Currently using this as my main NixOS machine. Will likely become a server, because it's got 8 fast cores and doesn't use much power, but all my other laptops run macOS or are terrible.

```txt
[wporter@t14g2a:~]$ nix run nixpkgs#fastfetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             wporter@t14g2a
          ▜███▙       ▜███▙  ▟███▛             --------------
           ▜███▙       ▜███▙▟███▛              OS: NixOS 25.05 (Warbler) x86_64
            ▜███▙       ▜██████▛               Host: 20XK006BUS (ThinkPad T14 Gen 2a)
     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: Linux 6.12.55
    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 36 mins
           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 1158 (nix-system)
          ▟███▛             ▜██▛ ▟███▛         Shell: bash 5.2.37
         ▟███▛               ▜▛ ▟███▛          Display (DELL UP2716D): 2560x1440 @ 60 Hz in 27" [External]
▟███████████▛                  ▟██████████▙    Display (DELL UP2716D): 2560x1440 @ 60 Hz in 27" [External]
▜██████████▛                  ▟███████████▛    DE: GNOME 48.2
      ▟███▛ ▟▙               ▟███▛             WM: Mutter (Wayland)
     ▟███▛ ▟██▙             ▟███▛              WM Theme: Adwaita
    ▟███▛  ▜███▙           ▝▀▀▀▀               Theme: Adwaita [GTK2/3/4]
    ▜██▛    ▜███▙ ▜██████████████████▛         Icons: Adwaita [GTK2/3/4]
     ▜▛     ▟████▙ ▜████████████████▛          Font: Adwaita Sans (11pt) [GTK2/3/4]
           ▟██████▙       ▜███▙                Cursor: Adwaita (24px)
          ▟███▛▜███▙       ▜███▙               Terminal: GNOME Console 48.0.1
         ▟███▛  ▜███▙       ▜███▙              Terminal Font: Adwaita Mono (11pt)
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              CPU: AMD Ryzen 7 PRO 5850U (16) @ 4.51 GHz
                                               GPU: AMD Radeon Vega Series / Radeon Vega Mobile Series [Integrated]
                                               Memory: 4.92 GiB / 45.89 GiB (11%)
                                               Swap: 0 B / 44.70 GiB (0%)
                                               Disk (/): 7.50 MiB / 850.84 GiB (0%) - zfs
                                               Local IP (wlp3s0): 172.27.254.220/24
                                               Battery (5B10W51827): 99% [AC Connected]
                                               Locale: en_US.UTF-8
```
