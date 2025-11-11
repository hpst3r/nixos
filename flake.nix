{
  description = "basic flake";

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
      lib = nixpkgs.lib;
    in {
    nixosConfigurations.LittleDude = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
	home-manager.nixosModules.home-manager
	# ./modules/ollama.nix
	./modules/grafana.nix # grafana service
	./modules/grafana-config.nix # grafana configuration for Prometheus
	./modules/prometheus-exporter.nix # prometheus node-exporter
	./modules/prometheus.nix # prometheus database
	./modules/victorialogs.nix # victorialogs database
	./modules/journald-upload.nix # victorialogs upload
	./modules/gnome.nix
	# ./modules/graylog.nix
      ];
    }; # system
  }; # inputs
} # nix
