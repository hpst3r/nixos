{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    btop
  ];

}