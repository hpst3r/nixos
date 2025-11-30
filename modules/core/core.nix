{ pkgs, lib, config, ... }:

let
  coreModules = [
    ./packages/base-pkgs.nix
    ./services/networking.nix
    ./services/sshd.nix
    ./services/tailscale.nix
    ./services/time.nix
    ./services/autogc.nix
    ./bootloader.nix
    ./kernel.nix
    ./locale.nix
    ./root-certs.nix
    ./users.nix
    ./nix.nix
  ];
in {

  imports = coreModules;

}