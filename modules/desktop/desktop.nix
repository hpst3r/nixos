{ pkgs, config, lib, self, home-manager, ... }:

let
  desktopModules = [
    "${self}/modules/desktop/applications/gnome/gnome.nix"
    "${self}/modules/desktop/applications/1password.nix"
    "${self}/modules/desktop/applications/desktop-pkgs.nix"
    "${self}/modules/desktop/applications/signed-git.nix"
    "${self}/modules/desktop/applications/gh.nix"
    "${self}/modules/desktop/applications/virt-manager.nix"
    "${self}/modules/desktop/applications/ssh.nix"
    "${self}/modules/desktop/services/audio.nix"
    "${self}/modules/desktop/services/bluetooth.nix"
    "${self}/modules/desktop/services/cups.nix"

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