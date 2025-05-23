{ lib, ... }:

{
  home = {
    username = "orest";
    homeDirectory = "/home/orest";
    stateVersion = "24.11"; # Don't change!
  };

  dconf.settings = import ./dconf.nix { inherit lib; };
  
  fonts.fontconfig = {
    defaultFonts = {
      sansSerif = [ "Source Sans 3" ];
      serif = [ "Source Serif 4" ];
      monospace = [ "Iosevka Nerd Font" ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };
}
