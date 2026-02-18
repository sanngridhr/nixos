{ config, globalVariables, lib, osConfig, pkgs, ... }:

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

  services.unison = let
    devices = [ "GLaDOS" "Adventure" ];

    localHost = osConfig.networking.hostName;
    remoteDevices = lib.filter (d: d != localHost) devices;

    folders = [
      { path = "/data/rpg"; }
      { path = "/data/docs"; }
    ];

    unisonPairs =
      lib.flatten (lib.map (folder:
        lib.map (remote:
          {
            name  = "${lib.replaceStrings ["/"] ["_"] folder.path}-${remote}";
            value = {
              roots = [
                folder.path
                "ssh://user@${remote}/${folder.path}"
              ];
            };
          }
        ) remoteDevices
      ) folders)
        |> lib.listToAttrs;
  in {
    enable = true;
    package = pkgs.unison;
    pairs = unisonPairs;
  };
  
  xdg.autostart = {
    enable = true;
    entries = with builtins; [
      ./static/startup-sound/startup-sound.desktop
    ] ++ ({
      firefox = "firefox";
      telegram-desktop = "org.telegram.desktop";
      vesktop = "vesktop";
      steam = "steam";
    } |> mapAttrs (package: entry: "${pkgs.${package}}/share/applications/${entry}.desktop")
      |> attrValues);
  };

  dconf.settings = import ./dconf.nix { inherit lib globalVariables; };
}
