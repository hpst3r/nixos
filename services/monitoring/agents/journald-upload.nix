{ config, pkgs, ... }:

{
  services.journald.upload = {
    enable = true;
    settings.Upload = {
      URL = "https://victorialogs.lab.wporter.org:443/insert/journald";
      Compression = "zstd:3";
      ServerCertificateFile = "-"; # RTFM - this, not null, disables client cert auth
      ServerKeyFile = "-";
      TrustedCertificateFile = "-"; # don't use /etc/ssl/ca/trusted.pem
    }; # for a full list of options, see journal-upload.conf docs:
    # https://www.freedesktop.org/software/systemd/man/latest/journal-upload.conf.html#
  };
}
