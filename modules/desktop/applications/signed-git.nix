{ config, lib, pkgs, home-manager, ... }:

{
  home-manager.users.wporter.programs.git = {
    enable = true;
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        # grab first authorized key for my user
        signingKey = builtins.head config.users.users.wporter.openssh.authorizedKeys.keys;
      }; # user
    }; # extraConfig
  }; # git
}