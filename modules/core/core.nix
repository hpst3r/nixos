{ pkgs, lib, config, ... }:

let
  coreModules = [
    ./packages/base-pkgs.nix
    ./services/networking.nix
    ./services/sshd.nix
    ./services/tailscale.nix
    ./services/time.nix
    ./services/autogc.nix
    ./system/bootloader.nix
    ./system/kernel.nix
    ./system/locale.nix
    ./pki/root-certs.nix
    ./users/wporter.nix
    ./nix.nix
  ];
in {

  imports = coreModules;

}