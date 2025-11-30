{ config, pkgs, ... }:

{
  services.journald.upload = {
    enable = true;
    settings.Upload = {
      URL = "https://victorialogs.lab.wporter.org:443/insert/journald";
      ServerCertificateFile = "-"; # RTFM - this, not null, disables client cert auth
      ServerKeyFile = "-";
      TrustedCertificateFile = "-"; # don't use /etc/ssl/ca/trusted.pem
    };
  };
}
