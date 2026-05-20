{ lib, globalVariables, ... }:

{
  "org/gnome/desktop/background" = {
    picture-uri = "file://${globalVariables.background}";
    picture-uri-dark = "file://${globalVariables.background}";
  };

  "org/gnome/desktop/input-sources" = {
    sources = [["xkb" "us"] ["xkb" "ua"]] |> map lib.hm.gvariant.mkTuple;
    xkb-options = [ "lv3:ralt" "compose:ralt" ];
  };
  
  "org/gnome/desktop/interface" = {
    accent-color = "slate";
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
    switch-input-source = [ "<Alt>Shift_L" ];
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
    workspace-names = [
      "α"
      "β"
      "γ"
      "δ"
      "ε"
      "ϛ"
    ];
  };

  "org/gnome/evince/default" = {
    continuous = true;
    dual-page = true;
    dual-page-odd-left = true;
    show-sidebar = true;
    sizing-mode = "fit-page";
  };
}
