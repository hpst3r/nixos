{...}: {
  networking.nftables.enable = true;
  networking.firewall.allowedTCPPorts = [ 8443 ]; # incus api https
  networking.firewall.interfaces.incusbr0.allowedTCPPorts = [
    53
    67
  ];
  networking.firewall.interfaces.incusbr0.allowedUDPPorts = [
    53
    67
  ];
  virtualisation.incus = {
    enable = true;
    preseed = {
      "config" = {
        "core.https_address" = ":8443";
      };
      "networks" = [ {
          "name" = "incusbr0";
          "type" = "bridge";
          "config" = {
            "ipv4.address" = "192.0.2.1/24";
            "ipv4.nat" = "true";
          };
        }
      ];
      "storage_pools" = [ {
          "config" = {
            "source" = "/var/lib/incus/storage-pools/default";
          };
          "driver" = "dir";
          "name" = "default";
        }
      ];
      "profiles" = [ {
          "description" = "Default Incus profile";
          "config" = {
            "limits.cpu" = "4";
            "limits.memory" = "4GiB";
          };
          "devices" = {
            "eth0" = {
              "name" = "eth0";
              "nictype" = "bridged";
              "parent" = "incusbr0";
              "type" = "nic";
            };
            "root" = {
              "path" = "/";
              "pool" = "default";
              "size" = "16GB";
              "type" = "disk";
            };
          };
          "name" = "default";
        }
      ];
    };
  };
}