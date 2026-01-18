{ config, pkgs, ... }:

{
  imports = [ ./nginx-victoriametrics.nix ];
  services.victoriametrics = {
    enable = true;
    listenAddress = "127.0.0.1:8428";
    extraOptions = [
      "-retentionPeriod=52w"
    ];
  };
}