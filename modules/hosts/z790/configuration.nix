{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "bd833a32";

  imports = [
    "${self}/modules/desktop/desktop.nix"
    "${self}/modules/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/modules/services/monitoring/agents/journald-upload.nix"
    "${self}/modules/services/virtualization/libvirt.nix"
  ];

  system.stateVersion = "26.05";

}