{ pkgs, config, lib, ...}:

let
  cfg = config.onepass;
in
{

  # options.enable = lib.mkEnableOption "Enable 1Password";

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "wporter" ];
  };

}