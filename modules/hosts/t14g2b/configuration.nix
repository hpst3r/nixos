{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "68a20cc5";

  imports = [
    "${self}/modules/desktop/desktop.nix"
    "${self}/modules/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/modules/services/monitoring/agents/journald-upload.nix"
    "${self}/modules/services/virtualization/incus.nix"
  ];

  services.logind.settings.Login = {
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitch = "ignore";
  };

  system.stateVersion = "25.05";

}