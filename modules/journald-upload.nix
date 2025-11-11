{ config, pkgs, ... }:

{

  services.journald.upload = {
    enable = true;
    settings.Upload.URL = "http://${config.services.victorialogs.listenAddress}/insert/journald";
  };

}
