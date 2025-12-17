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
    virtualHosts."vl.lab.wporter.org" = {
      enableACME = true;
      forceSSL = true;
      # disable http/2 to work around https://github.com/systemd/systemd/issues/39166
      # must be disabled for all server blocks - nginx limitation
      http2 = false;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9428";
      };
    };
    virtualHosts."victorialogs.lab.wporter.org" = {
      # listen 80 ; (https redirect)
      # listen 443 ssl ;
      # listen on journald port - selinux workaround
      extraConfig = ''
	      listen 0.0.0.0:19532 ssl ;
      '';
      forceSSL = true;
      enableACME = true;
      # disable http/2 to work around https://github.com/systemd/systemd/issues/39166
      http2 = false;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9428";
      };
      locations."/insert/journald" = {
        proxyPass = "http://127.0.0.1:9428";
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
