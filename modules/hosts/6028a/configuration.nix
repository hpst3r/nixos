{ config, self, lib, ... }: with lib; {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "71803014";

  imports = [
    "${self}/modules/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/modules/services/monitoring/agents/journald-upload.nix"
  ];

  system.stateVersion = "25.05";

  # config for mirrored bootloader

  boot.loader.systemd-boot.enable = false; # override default in core/bootloader.nix

  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    device = "nodev"; # tells grub to not install to mbr
    mirroredBoots = mkForce [ # override implicit /boot
      { devices = [ "nodev" ]; path = "/boot1"; efiSysMountPoint = "/boot1"; }
      { devices = [ "nodev" ]; path = "/boot2"; efiSysMountPoint = "/boot2"; }
    ];
  };
 
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "zfs" ];
  
  # prevents "multiple pools with same name" problem during boot
  boot.zfs.devNodes = "/dev/disk/by-partuuid";

  hardware.infiniband = {
    enable = true;
    guids = [ "0xe41d2d0300b3f511" "0xe41d2d0300b3f512" ];
  };

}