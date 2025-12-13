{ pkgs, config, self, ... }:

{
  imports = [
    "${self}/modules/desktop/games/pcsx2.nix"
    "${self}/modules/desktop/games/rpcs3.nix"
    "${self}/modules/desktop/games/steam.nix"
  ];
}