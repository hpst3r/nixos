{ pkgs, config, lib, ... }: {

  # zfs
  networking.hostId = "1c785dc8";

  imports = [
    ../../desktop/desktop.nix
  ];

  system.stateVersion = "25.05";

}