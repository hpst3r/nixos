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
	        client_max_body_size 256M;
        ''; # journal uploads can be quite large & journal-upload.service will just kill itself if it can't shove a whole load into the server at once
      };
    };
  };
}
