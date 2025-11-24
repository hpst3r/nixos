{ pkgs, home-manager, ... }:

{
  home-manager.users.wporter.programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    }; # ch
  }; # gh
}