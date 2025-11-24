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
    };
  };
}
