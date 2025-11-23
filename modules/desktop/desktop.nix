{ pkgs, config, lib, home-manager, ... }:

let
  desktopModules = [
    ./applications/gnome/gnome.nix
    ./applications/1password.nix
    ./applications/desktop-pkgs.nix
    ./applications/signed-git.nix
    ./applications/gh.nix
    ./applications/ssh.nix
    ./services/audio.nix
    ./services/bluetooth.nix
    ./services/cups.nix
  ];
in {

  imports = desktopModules;
  
}