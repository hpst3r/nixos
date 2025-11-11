{ config, lib, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    loadModels = [ "phi3:3.8b-mini-4k-instruct-q4_0" ];
    acceleration = "rocm";
    rocmOverrideGfx = "9.0.0";
  };
}
