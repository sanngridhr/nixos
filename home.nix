{
  config,
  globalVariables,
  lib,
  osConfig,
  pkgs,
  inputs,
  ...
}:

{
  home = {
    username = osConfig.users.users.orest.name;
    homeDirectory = osConfig.users.users.orest.home;
    stateVersion = "24.11"; # Don't change!

    file =
      with builtins;
      let
        home = config.home.homeDirectory;
        xdgDir = home + "/.config/";
        repoDir = home + "/config/";
        mkConfigLinks =
          item:
          let
            isStr = builtins.isString item;
            src = if isStr then item else item.src;
            dsts = if isStr then [ item ] else item.dsts;
          in
          map (d: {
            name = xdgDir + d;
            value = {
              source = config.lib.file.mkOutOfStoreSymlink (repoDir + src);
            };
          }) dsts;
      in
      [
        {
          src = "Code/User/settings.json";
          dsts = [
            "Code/User/settings.json"
            "Cursor/User/settings.json"
            "VSCodium/User/settings.json"
          ];
        }
        "bottom"
        "cabal"
        "emacs/GNUEmacs.png"
        "emacs/early-init.el"
        "emacs/elpaca-setup.el"
        "emacs/init.el"
        "gallery-dl"
        "ghostty"
        "git"
        "tealdeer"
      ]
      |> concatMap mkConfigLinks
      |> listToAttrs;
  };

  xdg.autostart = {
    enable = true;
    entries =
      with builtins;
      let
        unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.stdenv.hostPlatform.system}";
      in
      [
        ./static/startup-sound/startup-sound.desktop
        "${unstable.telegram-desktop}/share/applications/org.telegram.desktop.desktop"
      ]
      ++ (
        {
          firefox = "firefox";
          vesktop = "vesktop";
          steam = "steam";
        }
        |> mapAttrs (package: entry: "${pkgs.${package}}/share/applications/${entry}.desktop")
        |> attrValues
      );
  };

  # dconf.settings = import ./dconf.nix { inherit lib globalVariables; };
}
