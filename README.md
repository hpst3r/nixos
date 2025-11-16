
# Readme

My NixOS system configurations. Modular (flakes and `import-tree`) but otherwise fairly standard (attempting to KISS).

Still getting an idea of how I want to organize things.

## Layout

### flake.nix

Defines:

- inputs (nixpkgs, home-manager, import-tree)
- `mkHost` (a function to template my nixosSystems from the directory structure in this repo)
  - `mkHost` defines imports for the particular host. These are intended to be used to override configuration defaults when applicable.
- the entrypoints/definitions for my systems (using `mkHost`)

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

### modules: services

Hosted services. Explicitly enabled per machine.

- Hosted apps
- Infrastructure services (DNS, etc)
- Monitoring
- Custom applets
- Virtualization
- Containerization

### modules: daemons

Daemons, e.g., the Prometheus node-exporter, journald-upload or log shippers, maintenance tasks.

## Setup

I've just been symlinking the `modules/` directory, my `flake.nix`, and the `configuration.nix` file from my repo to `/etc/nixos/`. Works for now.

```sh
sudo ln -s /home/wporter/nixos/modules /etc/nixos/modules

sudo ln -s /home/wporter/nixos/flake.nix /etc/nixos/flake.nix

sudo ln -s /home/wporter/nixos/configuration.nix /etc/nixos/configuration.nix
```
