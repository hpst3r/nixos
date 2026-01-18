{ config, lib, pkgs, modulesPath, ... }:

{
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "rpool/root";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  fileSystems."/nix" = {
    device = "rpool/nix";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  fileSystems."/var" = {
    device = "rpool/var";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  fileSystems."/home" = {
    device = "rpool/home";
    fsType = "zfs";
    options = [ "zfsutil" ];
  };

  fileSystems."/boot1" = {
    device = "/dev/disk/by-id/nvme-INTEL_SSDPEKKF256G7_BTPY80810ENZ256D-part1";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
      "umask=0077"
      "nofail"
    ];
  };

  fileSystems."/boot2" = {
    device = "/dev/disk/by-id/nvme-INTEL_SSDPEKKF256G7_BTPY80810SN4256D-part1";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
      "umask=0077"
      "nofail"
    ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}