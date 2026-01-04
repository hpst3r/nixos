{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "22432e3b";

  imports = [
    "${self}/modules/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/modules/services/monitoring/agents/journald-upload.nix"    
    "${self}/modules/services/virtualization/incus.nix"
  ];

  system.stateVersion = "26.05";

}