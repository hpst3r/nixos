{ pkgs, config, self, ... }:

{
  imports = [
    "${self}/desktop/games/pcsx2.nix"
    "${self}/desktop/games/rpcs3.nix"
    "${self}/desktop/games/steam.nix"
  ];
}