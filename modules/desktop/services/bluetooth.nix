{ config, ... }:

{
  # bluetooth; keep this here so nix always tries to enable it
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # show battery%
        Experimental = true;
	      # quicker connections at expense of more power usage (always scan, I think?)
        FastConnectable = true;
        # https://www.reddit.com/r/NixOS/comments/1ch5d2p/comment/lkbabax/
        # for pairing bluetooth controller
        Privacy = "device";
        JustWorksRepairing = "always";
        Class = "0x000100";
      };
      Policy = {
        # automatically enable any BT controller when found
        # this means adapters present on start & anything attached later
        AutoEnable = true;
      };
      
    };
  };
  
  hardware.xpadneo.enable = true; # Enable the xpadneo driver for Xbox One wireless controllers

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];
    extraModprobeConfig = ''
      options bluetooth disable_ertm=Y
    '';
    # connect xbox controller
  };
}