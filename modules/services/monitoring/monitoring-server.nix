{ ... }:

{
  imports = [
    "./servers/grafana/grafana.nix"
    "./servers/prometheus/prometheus.nix"
    "./servers/victorialogs/victorialogs.nix"
  ];
}