{ config, ... }:

{
  security.acme = {
    defaults.server = "https://intermediate-ca.lab.wporter.org/acme/acme/directory";
    defaults.renewInterval = "hourly";
    defaults.email = "noc@wporter.org";
    acceptTerms = true;
  };
  services.nginx = {
    enable = true;
    virtualHosts."vmui.lab.wporter.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:9428";
      };
    };
    virtualHosts."victorialogs.lab.wporter.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:9428";
      };
      locations."/insert/journald" = {
        proxyPass = "http://localhost:9428";
        extraConfig = ''
	        client_max_body_size 5G;
        ''; # journal uploads can be quite large & journal-upload.service will just kill itself
        # if it can't send a whole load of logs at the server at once. there is no way to limit this
        # on the client side AFAIK. as a workaround, toggle compression on client & allow big POSTs.
        # https://www.freedesktop.org/software/systemd/man/latest/journal-upload.conf.html
      };
    };
    # workaround to avoid requiring SELinux module for SELinux-enabled clients
    # listen on 19532; SELinux blocks name_connect to 443 for systemd_journal_upload_t
    virtualHosts."victorialogs.lab.wporter.org" = {
      forceSSL = true;
      locations."/insert/journald" = {
        listen.port = 19532;
        proxyPass = "http://localhost:9428";
        extraConfig = ''
	        client_max_body_size 5G;
        ''; # see abv
      };
    };

  };
}
