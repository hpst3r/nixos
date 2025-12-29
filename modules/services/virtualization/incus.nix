{...}: {
  networking.nftables.enable = true;
  virtualisation.incus = {
    enable = true;
    preseed = {
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
          "config" = {};
          "description" = "Default Incus profile";
          "devices" = {
            "eth0" = {
              "name" = "eth0";
              "network" = "incusbr0";
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