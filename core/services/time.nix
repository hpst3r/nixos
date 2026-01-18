{ config, lib, ... }:

{
  services.timesyncd.enable = true;
  time = with lib; {
    timeZone = mkDefault "America/New_York";
  };
}