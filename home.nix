{ config, globalVariables, lib, osConfig, pkgs, inputs, ... }:

{
  home = {
    username = osConfig.users.users.orest.name;
    homeDirectory = osConfig.users.users.orest.home;
    stateVersion = "24.11"; # Don't change!

    file = let
      programs = [
        "bottom"
        "cabal"
        "gallery-dl"
        "ghostty"
        "git"
        "starship"
        "tealdeer"
      ];
      home = config.home.homeDirectory;
      xdgDir = home + "/.config/";
      repoDir = home + "/config/";
      mkConfigLink = path: {
        name = xdgDir + path;
        value = { source = config.lib.file.mkOutOfStoreSymlink (repoDir + path); };
      };
    in builtins.listToAttrs (map mkConfigLink (programs ++ [
      "VSCodium/User/settings.json"
      "emacs/init.el"
      "emacs/elpaca-setup.el"
      "emacs/early-init.el"
      "emacs/GNUEmacs.png"
    ]));
  };
  
  xdg.autostart = {
    enable = true;
    entries = with builtins; let
      unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.stdenv.hostPlatform.system}";
    in [
      ./static/startup-sound/startup-sound.desktop
      "${unstable.telegram-desktop}/share/applications/org.telegram.desktop.desktop"
    ] ++ ({
      firefox = "firefox";
      vesktop = "vesktop";
      steam = "steam";
    } |> mapAttrs (package: entry: "${pkgs.${package}}/share/applications/${entry}.desktop")
      |> attrValues);
  };

  dconf.settings = import ./dconf.nix { inherit lib globalVariables; };
}
