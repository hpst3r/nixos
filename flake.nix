{
  description = "system flake";

  inputs = {
    # unstable package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkHost = hostName:
        let
          system = nixpkgs.lib.strings.trim (
            builtins.readFile ./hosts/${hostName}/_system
          );
        in
          nixpkgs.lib.nixosSystem {

            # import system type from hosts/hostname/system
            inherit system;
            
            # allow modules to use hostname
            specialArgs = {
              inherit hostName self;
            };

            modules = [

              ({ lib, ... }: {
                options.desktop.enable = lib.mkEnableOption "desktop environment, apps and services";
              })

              # core config
              ./core/core.nix
                            
              # hardware config
              ./hosts/${hostName}/hardware-configuration.nix

              # per-system config
              ./hosts/${hostName}/configuration.nix

              # home-manager
              home-manager.nixosModules.home-manager

              { networking.hostName = hostName; }

            ]; # system
      }; # mkHost

    in {

      # templated system definitions. uses mkHost to reuse code

      nixpkgs.config.allowUnfree = true;

      nixosConfigurations = {
        "z790"    = mkHost "z790";
        "t14g2a"  = mkHost "t14g2a";
        "t14g2b"  = mkHost "t14g2b";
        "xps9380" = mkHost "xps9380";
        "600g4a"  = mkHost "600g4a";
        "6028a"   = mkHost "6028a";
        "e32a"    = mkHost "e32a";
        "e32b"    = mkHost "e32b";
        "e32c"    = mkHost "e32c";
        "e32d"    = mkHost "e32d";
        "monitor" = mkHost "monitor";
      };
  }; # inputs
} # nix
