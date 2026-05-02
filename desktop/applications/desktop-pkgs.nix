{ pkgs, config, ...}:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks
  ];

  users.users.wporter = {
    packages = with pkgs; [
      obsidian
      logseq
      geary
      spotify
      powershell
      drawio
      vscode
      onlyoffice-desktopeditors
    ];
  };

  programs.neovim.enable = true;

  fonts = {
    packages = with pkgs; [
      inter
      jetbrains-mono
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Inter" ];
	      monospace = [ "JetBrains Mono" ];
      }; # defaultFonts
    }; # fontconfig
  }; # fonts 
}
