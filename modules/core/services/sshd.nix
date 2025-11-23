{ config, lib, ... }:

{
  services.openssh = with lib; {
    enable = mkDefault true;
    settings.PasswordAuthentication = mkDefault false;
  };
  networking.firewall.allowedTCPPorts = [ 22 ];
}