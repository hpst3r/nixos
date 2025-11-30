{ config, self, lib, ... }: with lib; {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "71803014";

  imports = [];

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.enable = false; # override default in core/bootloader.nix

  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    device = "nodev"; # tells grub to not install to mbr
    mirroredBoots = [
      { devices = [ "nodev" ]; path = "/boot1"; efiSysMountPoint = "/boot1"; }
      { devices = [ "nodev" ]; path = "/boot2"; efiSysMountPoint = "/boot2"; }
    ];
  };
 
  boot.loader.efi = mkForce {
    canTouchEfiVariables = false; # automatic efi var mgmt only for boot1
    # efiSysMountPoint = ; # so GRUB doesn't try to install to /boot
  };

  boot.supportedFilesystems = [ "zfs" ];
  
  # prevents "multiple pools with same name" problem during boot
  boot.zfs.devNodes = "/dev/disk/by-partuuid";

}