{ config, self, lib, ... }: with lib; {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "e6607833";

  imports = [
    "${self}/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/services/monitoring/agents/journald-upload.nix"
    "${self}/services/virtualization/incus.nix"
  ];

  system.stateVersion = "26.05";

  # config for mirrored bootloader

  boot.loader.systemd-boot.enable = false; # override default in core/bootloader.nix

  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
    # tells grub to not install to mbr
    device = "nodev";
    # override implicit /boot with /boot{1,2}
    mirroredBoots = mkForce [
      { devices = [ "nodev" ]; path = "/boot1"; efiSysMountPoint = "/boot1"; }
      { devices = [ "nodev" ]; path = "/boot2"; efiSysMountPoint = "/boot2"; }
    ];
  };
 
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "zfs" ];
  
  # prevents "multiple pools with same name" problem during boot
  boot.zfs.devNodes = "/dev/disk/by-partuuid";

  # systemd.network = {
  #   "10-br0.network" = {
  #     MatchBridge = "br0";
  #     DHCP = "yes";
  #   };
  # }

}