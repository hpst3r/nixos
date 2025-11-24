{ pkgs, config, lib, ... }: {

  # zfs
  networking.hostId = "68a20cc5";

  imports = [
    ../../desktop/desktop.nix
  ];

  system.stateVersion = "25.05";

}