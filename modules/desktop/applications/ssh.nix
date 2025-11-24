{ config, lib, home-manager, ... }:

let
  onePassSSHAgent = "~/.1password/agent.sock";
in {
  home-manager.users.wporter.programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassSSHAgent}
    '';
  }; # ssh
}