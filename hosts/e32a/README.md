
# Thinkstation E32

Little desktop, cluster node.

- i7-4790 (4c8t Haswell)
- 16g (4x4) DDR3 1600
- 240g Samsung something or other

Root on XFS.

```txt
[wporter@e32a:~]$ nix run nixpkgs#fastfetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             wporter@e32a
          ▜███▙       ▜███▙  ▟███▛             ------------
           ▜███▙       ▜███▙▟███▛              OS: NixOS 26.05 (Yarara) x86_64
            ▜███▙       ▜██████▛               Host: 30A2S01N00 (ThinkStation E32)
     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: Linux 6.12.59
    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 6 mins
           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 553 (nix-system)
          ▟███▛             ▜██▛ ▟███▛         Shell: bash 5.3.3
         ▟███▛               ▜▛ ▟███▛          Display (DELL E2211H): 1920x1080 in 22", 60 Hz [External]
▟███████████▛                  ▟██████████▙    Terminal: /dev/pts/0
▜██████████▛                  ▟███████████▛    CPU: Intel(R) Core(TM) i7-4790 (8) @ 4.00 GHz
      ▟███▛ ▟▙               ▟███▛             GPU: Intel Xeon E3-1200 v3/4th Gen Core Processor
     ▟███▛ ▟██▙             ▟███▛              Memory: 693.22 MiB / 15.42 GiB (4%)
    ▟███▛  ▜███▙           ▝▀▀▀▀               Swap: 0 B / 3.72 GiB (0%)
    ▜██▛    ▜███▙ ▜██████████████████▛         Disk (/): 4.76 GiB / 29.74 GiB (16%) - xfs
     ▜▛     ▟████▙ ▜████████████████▛          Local IP (eno1): 172.27.254.209/24
           ▟██████▙       ▜███▙                Locale: en_US.UTF-8
          ▟███▛▜███▙       ▜███▙
         ▟███▛  ▜███▙       ▜███▙                                      
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘                                      
```
