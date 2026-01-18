{ config, self, ... }: {

  imports = [
    #"${self}/desktop/desktop.nix"

    "${self}/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/services/monitoring/agents/journald-upload.nix"

    "${self}/services/monitoring/monitoring-server.nix"
  ];

  services.logind.settings.Login = {
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitch = "ignore";
  };

  system.stateVersion = "25.05";

}