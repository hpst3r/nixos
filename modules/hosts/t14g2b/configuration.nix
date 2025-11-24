{ config, self, ... }: {

  # zfs
  networking.hostId = "68a20cc5";

  imports = [
    "${self}/modules/desktop/desktop.nix"
  ];

  system.stateVersion = "25.05";

}