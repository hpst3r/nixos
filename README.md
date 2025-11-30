
# Readme

My NixOS system configurations. Fairly standard modular config. No import-tree for simplicity.

Still getting an idea of how I want to organize things and working on moving services over to Nix.

## Layout

### flake.nix

Defines:

- inputs (nixpkgs, home-manager)
- `mkHost` (a function to template my nixosSystems from the directory structure in this repo)
  - `mkHost` defines imports for the particular host. These are intended to be used to override configuration defaults when applicable.
- the entrypoints/definitions for my systems (using `mkHost`)
  - systems import their 'hosts' directory by hostname
  - hosts directory contains per-machine overrides and further imports

### configuration.nix

Exists to define my global recursive imports, stateVersion, and enable flakes.

Imports everything in `modules/core`.

### modules: core

Core components of the system:

- base packages (basic tools, text editors)
- common home-manager config (git username)
- core services (networking, sshd, time)
- the bootloader
- the kernel
- locale settings
- custom root certificates
- users

### modules: applications

Interactive apps for my desktop systems.

- desktop environment config
- desktop packages (browser, Spotify, etc)
- 1Password
  - 1Password SSH agent
  - using 1Pass SSH agent to sign Git commits

### modules: services/"$category"/{servers,agents}

Hosted services or agents for those services, where applicable.

Explicitly imported at machine level, often as metapackages (e.g., monitoring-server.nix imports grafana.nix -> grafana-nignx.nix, prometheus.nix, victorialogs.nix -> vmui-nginx.nix).

### hosts

Imported by hostname by mkHost.

Overrides, imports, or special configuration per host (e.g., custom bootloader configuration, the hardware configuration, imports for desktop package set or service package sets).

## Setup

```sh
sudo rm -rf /etc/nixos
sudo ln -s /etc/nixos ~/nixos
```
