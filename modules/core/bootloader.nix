{ config, ... }:

{
  
  # Bootloader. TODO: switch to GRUB
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

}