{ pkgs, lib, config, ... }:

let
  coreModules = [
    ./packages/base-pkgs.nix
    ./packages/home-manager.nix
    ./services/networking.nix
    ./services/sshd.nix
    ./services/tailscale.nix
    ./services/time.nix
    ./bootloader.nix
    ./kernel.nix
    ./locale.nix
    ./root-certs.nix
    ./users.nix
  ];
in {

  imports = coreModules;

}