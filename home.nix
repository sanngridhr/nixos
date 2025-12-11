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
        "emacs"
        "gallery-dl"
        "ghostty"
        "git"
        "starship"
        "tealdeer"
      ];
      home = config.home.homeDirectory;
      mkConfig = program: {
        name = "${home}/.config/${program}";
        value = { source = config.lib.file.mkOutOfStoreSymlink "${home}/config/${program}"; };
      };
    in builtins.listToAttrs (map mkConfig programs);
  };

  dconf.settings = import ./dconf.nix { inherit lib globalVariables; };
}
