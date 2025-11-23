{ pkgs, config, lib, ... }: {

  # zfs
  networking.hostId = "1c785dc8";

  desktop.enable = true;

  system.stateVersion = "25.05";

}