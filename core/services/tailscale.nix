{ config, lib, ... }:

{
  services.tailscale = with lib; {
    enable = true;
    useRoutingFeatures = mkDefault "client";
  };
}
