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

            # import system type from hosts/hostname/system
            inherit system;

            # allow modules to use hostname
            specialArgs = {
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
      # templated system definitions. uses mkHost to reuse code
      nixosConfigurations = {
        "z790"  = mkHost "z790";
        "t14g2" = mkHost "t14g2";
        "9380"  = mkHost "9380";
      };
  }; # inputs
} # nix
