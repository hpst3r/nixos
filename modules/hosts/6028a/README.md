
# 6028U-TR4T+ #1

Supermicro SuperServer 6028U-TR4T+

- 2x E5-2660 v4 (14c28t @ 2.6 GHz on 14c, 3.2 GHz on 1c - 28c56t)
- 8x 16gb DDR4 2400 RDIMM (128gb)
- 2x (mirrored) Intel DC S3510 480gb SATA SSD (boot, rpool)
- 2x (mirrored) Intel DC S4510 480gb SATA SSD (dpool-special)
- 12x (RAIDZ member) HGST HUS724040AL640 4tb SAS HDD (dpool)
- Dell HBA330 (LSI 3008, mpt3sas)
- 4x Intel X540 10gbe Base-T NICs
- 1x MXC413A ConnectX-4 LX 40gbe (QSFP) NIC

Root on mirrored ZFS.

Lab machine. Used for benchmarking ZFS performance/storage over network, running VMs, and occasionally as a backup target. Memory/disk/NIC count/CPUs vary frequently.

```txt
[wporter@6028a:~]$ nix run nixpkgs#fastfetch
          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖             wporter@6028a
          ▜███▙       ▜███▙  ▟███▛             -------------
           ▜███▙       ▜███▙▟███▛              OS: NixOS 25.05 (Warbler) x86_64
            ▜███▙       ▜██████▛               Host: PIO-628U-TR4T+-ST031 (0123456789)
     ▟█████████████████▙ ▜████▛     ▟▙         Kernel: Linux 6.12.55
    ▟███████████████████▙ ▜███▙    ▟██▙        Uptime: 2 mins
           ▄▄▄▄▖           ▜███▙  ▟███▛        Packages: 565 (nix-system)
          ▟███▛             ▜██▛ ▟███▛         Shell: bash 5.2.37
         ▟███▛               ▜▛ ▟███▛          Display (DELL P2219H): 1920x1080 @ 60 Hz in 21" [External]
▟███████████▛                  ▟██████████▙    Terminal: /dev/pts/0
▜██████████▛                  ▟███████████▛    CPU: 2 x Intel(R) Xeon(R) E5-2660 v4 (56) @ 3.20 GHz
      ▟███▛ ▟▙               ▟███▛             GPU: ASPEED Technology, Inc. ASPEED Graphics Family
     ▟███▛ ▟██▙             ▟███▛              Memory: 3.15 GiB / 125.76 GiB (3%)
    ▟███▛  ▜███▙           ▝▀▀▀▀               Swap: Disabled
    ▜██▛    ▜███▙ ▜██████████████████▛         Disk (/): 117.12 MiB / 427.09 GiB (0%) - zfs
     ▜▛     ▟████▙ ▜████████████████▛          Local IP (enp1s0f1): 192.168.77.30/24
           ▟██████▙       ▜███▙                Locale: en_US.UTF-8
          ▟███▛▜███▙       ▜███▙
         ▟███▛  ▜███▙       ▜███▙
         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘
```
