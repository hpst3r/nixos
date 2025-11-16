{ config, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.allowPing = true;
}