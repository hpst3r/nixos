{ config, lib, ... }:

{
  services.openssh = with lib; {
    enable = mkDefault true;
    passwordAuthentication = mkDefault false;
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
}