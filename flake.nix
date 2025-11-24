{
  description = "system flake";

  inputs = {
    # 25-05 package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      
      mkHost = hostName:

        let
          system = nixpkgs.lib.strings.trim (
            builtins.readFile ./modules/hosts/${hostName}/_system
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
              ./modules/core/core.nix
                            
              # hardware config
              ./modules/hosts/${hostName}/hardware-configuration.nix

              # per-system config
              ./modules/hosts/${hostName}/configuration.nix

              # home-manager
              home-manager.nixosModules.home-manager

              { networking.hostName = hostName; }

            ]; # system
      }; # mkHost

    in {

      # templated system definitions. uses mkHost to reuse code

      nixpkgs.config.allowUnfree = true;

      nixosConfigurations = {
        "z790"  = mkHost "z790";
        "t14g2a" = mkHost "t14g2a";
        "t14g2b" = mkHost "t14g2b";
        "xps9380"  = mkHost "xps9380";
      };
  }; # inputs
} # nix
