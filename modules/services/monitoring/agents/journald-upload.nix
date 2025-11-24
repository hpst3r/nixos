{ config, pkgs, ... }:

{
  services.journald.upload = {
    enable = true;
    settings.Upload.URL = "https://victorialogs.lab.wporter.org/insert/journald";
  };
}
