{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "71803014";

  imports = [];

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.enable = false; # override default in core/bootloader.nix

  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    mirroredBoots = [
      { devices = [ "/dev/disk/by-id/ata-INTEL_SSDSC2BB480G4_BTWL5223027M480QGN-part1" ]; path = "/boot1"; }
      { devices = [ "/dev/disk/by-id/ata-INTEL_SSDSC2BB480G4_BTWL52220571480QGN-part1" ]; path = "/boot2"; }
    ];
  };
 
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.enableUnstable = true;
  
  # prevents "multiple pools with same name" problem during boot
  # boot.zfs.devNodes = "/dev/disk/by-partuuid";

}