{ pkgs, config, home-manager, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.wporter = { pkgs, ... }: {
    home.stateVersion = "25.05"; # static
    home.packages = with pkgs; [
      vscode-fhs
    ];

    programs.git = {
      enable = true;
      userName = "William Porter";
      userEmail = "liam@wporter.org";
    };
  };
}
