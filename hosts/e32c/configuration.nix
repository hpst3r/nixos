{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "4fe11019";

  imports = [
    "${self}/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/services/monitoring/agents/journald-upload.nix"    
    "${self}/services/virtualization/incus.nix"
  ];

  system.stateVersion = "26.05";

}