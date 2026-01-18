
# Installation

Unified fat32 boot and ESP, 4gb of swap (no hibernate, just enough to save from OOM killer), 32g root. The rest of the disk will be used for shared storage.

```sh
sudo -i

parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart ESP fat32 1MB 1G
parted /dev/sda -- set 1 esp on
parted /dev/sda -- mkpart swap linux-swap 1G 5G
parted /dev/sda -- mkpart root 5G 37G

# get disk by-id

boot="/dev/disk/by-id/ata-SAMSUNG_MZ7TY256HDHP-000L7_S307NB0J519733-part1"
swap="/dev/disk/by-id/ata-SAMSUNG_MZ7TY256HDHP-000L7_S307NB0J519733-part2"
root="/dev/disk/by-id/ata-SAMSUNG_MZ7TY256HDHP-000L7_S307NB0J519733-part3"

mkswap -L swap "$swap"
swapon "$swap"

mkfs.xfs "$root"
mkdir /mnt
mount "$root" /mnt

mkfs.fat -F 32 -n boot "$boot"
mkdir /mnt/boot
mount "$boot" /mnt/boot

# grab hw config
nixos-generate-config --root /mnt
```

```txt
[root@nixos:~]# cd /mnt/etc/nixos

[root@nixos:/mnt/etc/nixos]# ls
configuration.nix  hardware-configuration.nix

[root@nixos:/mnt/etc/nixos]# cd ..

[root@nixos:/mnt/etc]# rm -rf nixos

[root@nixos:/mnt/etc]# ls

[root@nixos:/mnt/etc]# git clone https://github.com/hpst3r/nixos
Cloning into 'nixos'...
remote: Enumerating objects: 750, done.
remote: Counting objects: 100% (281/281), done.
remote: Compressing objects: 100% (199/199), done.
remote: Total 750 (delta 162), reused 168 (delta 69), pack-reused 469 (from 1)
Receiving objects: 100% (750/750), 95.18 KiB | 2.64 MiB/s, done.
Resolving deltas: 100% (441/441), done.

[root@nixos:/mnt/etc]# nixos-install --root /mnt --flake /mnt/etc/nixos#e32c
```

Post reboot:

```sh
su
# set my password
passwd wporter
# init overlay network
tailscale up
# clear out temp config cloned to /etc/nixos
rm -rf /etc/nixos
exit # exit su
# clone repo to homedir
git clone https://github.com/hpst3r/nixos /home/wporter/nixos
# then symlink config
sudo ln -s /home/wporter/nixos /etc/nixos
```

Incus (preseed takes care of most things):

```txt
[wporter@e32c:~]$ sudo incus config trust add-certificate lxconsole.crt
[wporter@e32c:~]$ sudo incus admin init
Would you like to use clustering? (yes/no) [default=no]: 
Do you want to configure a new storage pool? (yes/no) [default=yes]: no
Would you like to create a new local network bridge? (yes/no) [default=yes]: no
Would you like to use an existing bridge or host interface? (yes/no) [default=no]: no
Would you like the server to be available over the network? (yes/no) [default=no]: yes
Address to bind to (not including port) [default=all]: 
Port to bind to [default=8443]: 
Would you like stale cached images to be updated automatically? (yes/no) [default=yes]: 
Would you like a YAML "init" preseed to be printed? (yes/no) [default=no]: 
```
