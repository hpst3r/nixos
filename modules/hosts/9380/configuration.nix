{ config, self, ... }: {

  imports = [
    "${self}/modules/desktop/desktop.nix"

    "${self}/modules/services/monitoring/agents/prometheus-exporter.nix"

    "${self}/modules/services/monitoring/agents/journald-upload.nix"

    "${self}/modules/services/monitoring/servers/grafana/grafana.nix"
    "${self}/modules/services/monitoring/servers/grafana/nginx-grafana.nix"

    "${self}/modules/services/monitoring/servers/prometheus/prometheus.nix"

    "${self}/modules/services/monitoring/servers/victorialogs/victorialogs.nix"
    "${self}/modules/services/monitoring/servers/victorialogs/nginx-victorialogs.nix"
  ];

  system.stateVersion = "25.05";

}