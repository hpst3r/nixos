{ config, pkgs, ... }:

{
  imports = [ ./nginx-victoriametrics.nix ];
  services.victoriametrics = {
    enable = true;
    extraArgs = [
      "-retentionPeriod=52w"
    ];
  };
}