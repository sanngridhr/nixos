{ config, osConfig, lib, globalVariables, ... }:

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

  dconf.settings = import ./dconf.nix { inherit lib globalVariables; };
}
