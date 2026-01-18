{ config, self, ... }: {

  # zfs - gen with `head -c 4 /dev/random | od -A none -t x4`
  networking.hostId = "bd833a32";

  imports = [
    "${self}/desktop/desktop.nix"
    "${self}/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/services/monitoring/agents/journald-upload.nix"
    "${self}/services/virtualization/libvirt.nix"
    "${self}/services/virtualization/incus.nix"
    "${self}/desktop/games/games.nix"
  ];

  system.stateVersion = "26.05";

}