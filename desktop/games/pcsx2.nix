{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.pcsx2
  ];
}