{ config, home-manager, pkgs, ... }:

{
  # gnome uses wayland but you still need this
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  environment.gnome.excludePackages = with pkgs; [
    baobab # disk usage analyzer
    cheese # photobooth
    epiphany # web browser
    simple-scan # doc scanner
    yelp # help viewer
    geary # email client
    seahorse # password manager

    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    gnome-disk-utility
    gnome-connections
  ];

  home-manager.users.wporter = { pkgs, ... }: {
  
    # GNOME configuration
    dconf.settings = {
      "org/gnome/shell" = {
        favorite-apps = [
	  "firefox.desktop"
	  "code.desktop"
	  "org.gnome.kgx.desktop"
	  "spotify.desktop"
	  "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };
    };

    home.stateVersion = "25.05";
  };

}
