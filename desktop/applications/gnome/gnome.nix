{ config, home-manager, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.mutter]
    experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
  '';
  
  environment.gnome.excludePackages = with pkgs; [
    baobab # disk usage analyzer
    cheese # photobooth
    epiphany # web browser
    simple-scan # doc scanner
    yelp # help viewer
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
      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
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
