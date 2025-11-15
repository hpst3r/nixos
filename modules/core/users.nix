{ config, ... }:

{

  users.users.wporter = {
    isNormalUser = true;
    description = "William Porter";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}