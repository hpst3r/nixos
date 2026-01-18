{ pkgs, config, lib, ... }:

with lib; {
  boot.kernelPackages = mkDefault pkgs.linuxPackages;
}