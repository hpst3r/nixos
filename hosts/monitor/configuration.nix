{ config, self, ... }: {

  imports = [
    "${self}/services/monitoring/agents/prometheus-exporter.nix"
    "${self}/services/monitoring/agents/journald-upload.nix"
    "${self}/services/monitoring/monitoring-server.nix"
  ];

  systemd.network = {
    enable = true;
    networks."50-enp5s0" = {
      matchConfig.Name = "enp5s0";
      networkConfig = {
        DHCP = "ipv4";
        IPv6AcceptRA = true;
      };
      linkConfig.RequiredForOnline = "routable";
    };
  };

  system.stateVersion = "26.05";

}