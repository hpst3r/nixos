{ config, ... }:

{
  services.timesyncd.enable = true;
  time = {
    timeZone = "America/New_York";
  };
}