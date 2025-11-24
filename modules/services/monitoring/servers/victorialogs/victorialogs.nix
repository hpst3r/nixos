{ config, pkgs, ... }:

{
  imports = [ ./nginx-victorialogs.nix ];
  services.victorialogs = {
    enable = true;
    listenAddress = "localhost:9428";
    extraOptions = [
      "-retentionPeriod=14d"
    ];
  };
}
