{ lib, ... }:

{
  home = {
    username = "orest";
    homeDirectory = "/home/orest";
    stateVersion = "24.11";
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

    "org/gnome/evince" = {
      continuous = true;
      dual-page = true;
      dual-page-odd-left = true;
      show-sidebar = true;
      zoom = 0.5;
    };
    
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"              # 1st workspace
        "org.telegram.desktop.desktop" # 2nd workspace
        "vesktop.desktop"              # 3rd workspace
        "steam.desktop"                # 4th workspace
        "emacs.desktop"                # 5th workspace
        "writer.desktop"
        "org.gnome.Rhythmbox3.desktop" # 6th workspace
        "org.gnome.Calculator.desktop" # any workspace
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
