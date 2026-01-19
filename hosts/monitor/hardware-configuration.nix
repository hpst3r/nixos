{ config, lib, pkgs, modulesPath, ... }: {
    imports = [ "${modulesPath}/virtualisation/incus-virtual-machine.nix" ];
    # modulesPath is inputs.nixpkgs.lib.modulesPath,
    # this refers to https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/incus-virtual-machine.nix
}