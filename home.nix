{ config, lib, ... }:

{
  home = {
    username = "orest";
    homeDirectory = "/home/orest";
    stateVersion = "24.11"; # Don't change!
    sessionVariables = let
      HOME = config.home.homeDirectory;
      XDG_DATA_HOME = "{home}/.local/share";
    in {
      XDG_DATA_HOME = XDG_DATA_HOME;
      MINIKUBE_HOME = "${XDG_DATA_HOME}/minikube";
      
    };
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
