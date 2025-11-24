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
    virtualHosts."grafana.lab.wporter.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:3000";
	proxyWebsockets = true;
	extraConfig = ''
	  proxy_set_header Host $host;
	'';
      };
      locations."/api/live/" = {
	proxyPass = "http://localhost:3000";
	proxyWebsockets = true;
        extraConfig = ''
	  proxy_set_header Host $host;
	  proxy_set_header Upgrade $http_upgrade;
	  proxy_set_header Connection $connection_upgrade;
	'';
      };
    };
  };
}
