{ pkgs, config, lib, self, home-manager, ... }:

let
  desktopModules = [
    "${self}/desktop/applications/gnome/gnome.nix"
    "${self}/desktop/applications/firefox.nix"
    "${self}/desktop/applications/1password.nix"
    "${self}/desktop/applications/desktop-pkgs.nix"
    "${self}/desktop/applications/signed-git.nix"
    "${self}/desktop/applications/gh.nix"
    "${self}/desktop/applications/virt-manager.nix"
    "${self}/desktop/applications/ssh.nix"
    "${self}/desktop/services/audio.nix"
    "${self}/desktop/services/bluetooth.nix"
    "${self}/desktop/services/cups.nix"

    ./home-manager.nix
  ];
in {

  config.hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  config.onepass.enable = lib.mkDefault true;

  # if this is necessary, I don't think it will be
  # home-manager.backupFileExtension = ".oldhomebak";

  imports = desktopModules;

}