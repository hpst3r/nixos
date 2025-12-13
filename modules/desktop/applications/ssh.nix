{ config, lib, home-manager, ... }:

let
  onePassSSHAgent = "~/.1password/agent.sock";
in {
  home-manager.users.wporter.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*".identityAgent = onePassSSHAgent;
    # mellanox sx6036
    matchBlocks."192.168.77.200".extraOptions = {
      KexAlgorithms = "+diffie-hellman-group14-sha1";
      HostKeyAlgorithms = "+ssh-rsa,ssh-rsa-cert-v01@openssh.com";
    };
  }; # ssh
}