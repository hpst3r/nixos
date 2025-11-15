{ pkgs, config, ... }:

{

  # Use latest kernel.
  # TODO: this needs to be broken out for ZFS support. Maybe. I'd like latest in some places.
  boot.kernelPackages = pkgs.linuxPackages;

}