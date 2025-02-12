{ lib, ... }:

{
  home = {
    username = "orest";
    homeDirectory = "/home/orest";
    
    stateVersion = "24.11"; # Don"t change
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = with lib.hm.gvariant; [
        (mkTuple [ "xkb" "us" ])
        (mkTuple [ "xkb" "ua" ])
        (mkTuple [ "ibus" "libpinyin" ])
      ];
      xkb-options = [ "compose:ralt" "caps:menu" ];
    };

    "org/gnome/desktop/interface" = {
      cursor-theme = "Posy_Cursor";
      gtk-theme = "Materia-dark";
      font-name = "sans-serif 11";
      icon-theme = "Papirus-Dark";
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Alt>1" ];
      switch-to-workspace-2 = [ "<Alt>2" ];
      switch-to-workspace-3 = [ "<Alt>3" ];
      switch-to-workspace-4 = [ "<Alt>4" ];
      switch-to-workspace-5 = [ "<Alt>5" ];
      switch-to-workspace-6 = [ "<Alt>6" ];
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.telegram.desktop.desktop"
        "vesktop.desktop"
        "steam.desktop"
        "emacs.desktop"
        "writer.desktop"
        "org.gnome.Rhythmbox3.desktop"
        "org.gnome.Calculator.desktop"
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
