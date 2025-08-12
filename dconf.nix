{ lib, ... }:

{
  "org/gnome/desktop/input-sources" = {
    per-window = false;
    sources = with lib.hm.gvariant; [
      (mkTuple [ "xkb" "us" ])
      (mkTuple [ "xkb" "ua" ])
      (mkTuple [ "ibus" "libpinyin" ])
    ];
    
    xkb-options = [
      "compose:ralt"
      "shift:both_capslock"
      "caps:hyper"
    ];
  };

  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    cursor-size = 12;
    cursor-theme = "Posy_Cursor";
    gtk-theme = "Materia-dark";
    font-name = "sans-serif 11";
    icon-theme = "Papirus-Dark";
  };

  "org/gnome/desktop/wm/keybindings" = {
    move-to-workspace-1 = [ "<Alt><Shift>1" ];
    move-to-workspace-2 = [ "<Alt><Shift>2" ];
    move-to-workspace-3 = [ "<Alt><Shift>3" ];
    move-to-workspace-4 = [ "<Alt><Shift>4" ];
    move-to-workspace-5 = [ "<Alt><Shift>5" ];
    move-to-workspace-6 = [ "<Alt><Shift>6" ];
    switch-input-source = [ "<Alt>Hyper_L" ];
    switch-to-workspace-1 = [ "<Alt>1" ];
    switch-to-workspace-2 = [ "<Alt>2" ];
    switch-to-workspace-3 = [ "<Alt>3" ];
    switch-to-workspace-4 = [ "<Alt>4" ];
    switch-to-workspace-5 = [ "<Alt>5" ];
    switch-to-workspace-6 = [ "<Alt>6" ];
  };

  "org/gnome/desktop/wm/preferences" = {
    mouse-button-modifier = "<Alt>";
    num-workspaces = 6;
    workspace-names = [ "α" "β" "γ" "δ" "ε" "ϛ" ];
  };

  "org/gnome/evince/default" = {
    continuous = true;
    dual-page = true;
    dual-page-odd-left = true;
    show-sidebar = true;
    sizing-mode = "fit-page";
  };

  "org/gnome/shell" = {
    disable-user-extensions = false;

    enabled-extensions = [
      "appindicatorsupport@rgcjonas.gmail.com"
      "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
      "workspaces-by-open-apps@favo02.github.com"
    ];

    favorite-apps = [
      "firefox.desktop"
      "org.telegram.desktop.desktop"
      "vesktop.desktop"
      "steam.desktop"
      "emacs.desktop"
      "pycharm-community.desktop"
      "writer.desktop"
      "org.gnome.Rhythmbox3.desktop"
      "transmission-gtk.desktop"
      "org.gnome.Calculator.desktop"
      "org.gnome.Nautilus.desktop"
      "com.mitchellh.ghostty.desktop"
    ];
  };

  "org/gnome/shell/extensions/appindicator" = {
    tray-pos = "left";
  };

  "org/gnome/shell/extensions/auto-move-windows" = {
    application-list = [
      "firefox.desktop:1"
      "org.telegram.desktop.desktop:2"
      "vesktop.desktop:3"
      "steam.desktop:4"
      "org.gnome.Rhythmbox3.desktop:5"
      "org.nicotine_plus.Nicotine.desktop:6"
      "transmission-gtk.desktop:6"
    ];
  };

  "org/gnome/shell/extensions/workspaces-indicator-by-open-apps" = {
    apps-all-desaturate = false;
    apps-inactive-effect = "REDUCE OPACITY";
    apps-minimized-effect = "NOTHING";
    apps-symbolic-icons = false;
    hide-activities-button = false;
    icons-group = "GROUP AND SHOW COUNT";
    indicator-hide-empty = false;
    indicator-round-borders = false;
    indicator-show-indexes = true;
    indicator-use-custom-names = true;
    position-in-panel = "RIGHT";
    position-index = 0;
    scroll-inverse = true;
  };
}
