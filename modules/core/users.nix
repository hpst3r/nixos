{ config, ... }:

{

  users.users.wporter = {
    isNormalUser = true;
    description = "William Porter";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC7QvzfPqlU1OKcyF8FRVoPNdSl+dJWcePUWM/Rn2+nZ"
    ];
  };

}