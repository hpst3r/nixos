#!/usr/bin/env bash

while [[ $# -gt 0 ]]; do
  case "$1" in
    -r|--rebuild)
      rebuild=1
      shift
    ;;
    *)
      echo "Unknown argument: $1"
      shift
    ;;
  esac
done

echo "copy.sh: replacing /etc/nixos/configuration.nix..."
sudo cp -f ./configuration.nix /etc/nixos/configuration.nix

if [[ "$rebuild" ]]; then
  echo "copy.sh: rebuilding Nix..."
  sudo nixos-rebuild switch
fi
