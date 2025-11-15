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

    # import-tree
    import-tree.url = "github:vic/import-tree";
  };

  outputs = { self, nixpkgs, home-manager, import-tree, ... }@inputs:
    let
      
      mkHost = hostName:

        let
          system = nixpkgs.lib.strings.trim (
            builtins.readFile ./modules/hosts/${hostName}/_system
          );
        in
          nixpkgs.lib.nixosSystem {

            inherit system; # import system type from hosts/hostname/system

            specialArgs = { # allow modules to use hostname
              inherit inputs hostName;
            };

            modules = [

              # root config
              ./configuration.nix
              
              # hardware config
              ./modules/hosts/${hostName}/_hardware-configuration.nix
              
              # import-tree
              import-tree

              # home-manager
              home-manager.nixosModules.home-manager

              # host directory
              {
                imports = [( import-tree ./modules/hosts/${hostName} )];
                networking.hostName = hostName;
              }

            ]; # system
      }; # mkHost

    in {
      nixosConfigurations = {
        "Z790"           = mkHost "Z790";
        "T14G2-PF3LLSSV" = mkHost "T14G2-PF3LLSSV";
        "9380-BZ4R3X2"   = mkHost "9380-BZ4R3X2";
      };
  }; # inputs
} # nix
