{ config, pkgs, ... }:

{
  services.victorialogs = {
    enable = true;
    listenAddress = "localhost:9428";
    # port = 9428;
    extraOptions = [
      "-retentionPeriod=14d"
    ];
  };
}
