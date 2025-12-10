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
      extraConfig = ''
	      listen 19532;
      '';
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
  };
}
