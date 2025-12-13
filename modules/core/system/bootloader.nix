{ config, lib, ... }:

with lib; {
  
  # Bootloader. TODO: switch to GRUB
  boot.loader.systemd-boot.enable = mkDefault true;
  boot.loader.efi.canTouchEfiVariables = mkDefault true;

}