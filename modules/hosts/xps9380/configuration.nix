{ config, self, ... }: {

  imports = [
    #"${self}/modules/desktop/desktop.nix"

    "${self}/modules/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/modules/services/monitoring/agents/journald-upload.nix"

    "${self}/modules/services/monitoring/monitoring-server.nix"
  ];

  services.logind.lidSwitchDocked = "ignore";
  services.logind.lidSwitch = "ignore";

  system.stateVersion = "25.05";

}