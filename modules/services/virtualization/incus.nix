{}: {
  networking.nftables.enable = true;
  virtualization.incus = {
    enable = true;
    preseed = {
      networks = [ {
          name = "incusbr0";
          type = "bridge";
          config = {
            ipv4.address = "192.0.2.0/24";
            ipv4.nat = "true";
            ipv6.address = "none";
          };
        }
      ];
      storage_pools = [ {
          config = {
            source = "/var/lib/incus/storage-pools/default";
          };
          driver = "dir";
          name = "default";
        }
      ];
    }
  };
  services.incus = {
    enable = true;
  };
}