
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
