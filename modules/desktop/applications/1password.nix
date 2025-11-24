{ pkgs, config, lib, ...}:

let
  cfg = config.onepass;
in
with lib; {
  options.onepass.enable = lib.mkEnableOption "Enable 1Password";

  config = mkIf cfg.enable {
    programs._1password.enable = true;
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "wporter" ];
    }; # 1password-gui
  };
}