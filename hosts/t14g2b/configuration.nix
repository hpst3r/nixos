{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "68a20cc5";

  imports = [
    "${self}/desktop/desktop.nix"
    "${self}/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/services/monitoring/agents/journald-upload.nix"
    "${self}/services/virtualization/incus.nix"
  ];

  services.logind.settings.Login = {
    HandleLidSwitchDocked = "ignore";
    HandleLidSwitch = "ignore";
  };

  system.stateVersion = "25.05";

}