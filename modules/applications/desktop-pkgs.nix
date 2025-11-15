{ pkgs, config, ...}:

{

  nixpkgs.config.allowUnfree = true;

  users.users.wporter = {
    packages = with pkgs; [
      obsidian
      logseq
      geary
      gh
      spotify
      powershell
      drawio
      vscode
    ];
  };

  programs.firefox.enable = true;
  programs.neovim.enable = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "wporter" ];
  };

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
