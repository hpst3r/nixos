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
      };
      Policy = {
        # automatically enable any BT controller when found
        # this means adapters present on start & anything attached later
        AutoEnable = true;
      };
    };
  };
}