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
    virtualHosts."victoriametrics.lab.wporter.org" = {
      enableACME = true;
      forceSSL = true;
      # disable http/2 to work around https://github.com/systemd/systemd/issues/39166
      # must be disabled for all server blocks - nginx limitation
      http2 = false;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8428";
      };
    };
  };
}
