{ config, ... }:

{
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than-30d";
  };
  nix.extraOptions = ''
    min-free = ${toString (100*1024*1024)}
    max-free = ${toString (1024*1024*1024)}
  '';
}