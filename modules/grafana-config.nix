{ config, pkgs, ... }:

{
  services.grafana = {
    declarativePlugins = with pkgs.grafanaPlugins; [ victoriametrics-logs-datasource ];

    provision = {
      enable = true;

      dashboards.settings.providers = [{
        name = "Dashboards";
	disableDeletion = true;
	options = {
	  path = "/etc/grafana/dashboards";
	  foldersFromFilesStructure = true;
	};
      }]; # providers

      datasources.settings.datasources = [
        {
	  name = "Prometheus";
	  type = "prometheus";
	  url  = "http://${config.services.prometheus.listenAddress}:${toString config.services.prometheus.port}";
	  isDefault = true;
	  editable = false;
	}
	{
	  name = "VictoriaLogs";
	  type = "victoriametrics-logs-datasource";
	  url  = "http://localhost:9428";

	  editable = false;
	}
      ]; # datasources
    }; # provision
  }; # grafana
}
