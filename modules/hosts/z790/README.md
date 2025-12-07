
# z790

Intel Z790 desktop PC. Built early 2024.

Speed & power:

- i9-12900KS (8p8e24t Alder Lake) @ 150w PL1/PL2
- 64gb (2x32gb) DDR5-5600 c32-36-36-80 (6400c34, memory controller limitation)
- Sapphire Pulse RX 6800 XT 16gb (Navi 21)

Storage:

- 2tb Samsung 990 Evo Plus (zpool)
- 2tb Samsung 980 Pro (Windows 11 LTSC 2024)
- 1tb Samsung (OEM) 980 Pro (data)

Networking:

- Realtek RTL8125 (on mainboard)
- Mellanox ConnectX-4 LX (40GBe) via chipset PCIE 3.0x4 lanes (32 gbit theoretical max)
- Intel AX211NGW

Supporting components:

- SuperFlower Leadex V 130 1kw
- NZXT (ASRock) N7 Z790
- Thermalright PA120 SE v3

Root on (natively encrypted) ZFS.

```txt
[nix-shell:~]$ fastfetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             wporter@z790
          ▜███▙       ▜███▙  ▟███▛             ------------
           ▜███▙       ▜███▙▟███▛              OS: NixOS 26.05 (Yarara) x86_64
            ▜███▙       ▜██████▛               Host: N7 Z790
     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: Linux 6.12.59
    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 31 mins
           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 1287 (nix-system), 506 (nix-user)
          ▟███▛             ▜██▛ ▟███▛         Shell: bash 5.3.3
         ▟███▛               ▜▛ ▟███▛          Display (Lenovo Group Limited 27"): 2160x3840 @ 2.67x in 27", 60 Hz [External]
▟███████████▛                  ▟██████████▙    Display (LEN P27u-10): 3840x2160 @ 1.5x in 27", 60 Hz [External] *
▜██████████▛                  ▟███████████▛    Display (LEN P27u-10): 3840x2160 @ 1.5x in 27", 60 Hz [External]
      ▟███▛ ▟▙               ▟███▛             DE: GNOME 49.1
     ▟███▛ ▟██▙             ▟███▛              WM: Mutter (Wayland)
    ▟███▛  ▜███▙           ▝▀▀▀▀               WM Theme: Adwaita
    ▜██▛    ▜███▙ ▜██████████████████▛         Theme: Adwaita [GTK2/3/4]
     ▜▛     ▟████▙ ▜████████████████▛          Icons: Adwaita [GTK2/3/4]
           ▟██████▙       ▜███▙                Font: Adwaita Sans (11pt) [GTK2/3/4]
          ▟███▛▜███▙       ▜███▙               Cursor: Adwaita (24px)
         ▟███▛  ▜███▙       ▜███▙              Terminal: GNOME Console 49.1
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘              Terminal Font: Adwaita Mono (11pt)
                                               CPU: 12th Gen Intel(R) Core(TM) i9-12900KS (24) @ 5.50 GHz
                                               GPU: AMD Radeon RX 6800 XT [Discrete]
                                               Memory: 10.46 GiB / 62.56 GiB (17%)
                                               Swap: 0 B / 59.60 GiB (0%)
                                               Disk (/): 16.13 MiB / 1.68 TiB (0%) - zfs
                                               Local IP (wlp0s20f3): 172.27.254.70/24
                                               Locale: en_US.UTF-8
```
