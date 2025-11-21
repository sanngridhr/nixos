{ pkgs, inputs, globalVariables, ... }:

{
  imports = [
    inputs.steam-presence.nixosModules.steam-presence
    inputs.aagl.nixosModules.default
  ];
  
  nix = {
    package = pkgs.lix;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      use-xdg-base-directories = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
  
  programs = let
    enabled = [
      "bat"
      "evince"
      "file-roller"
      "firefox"
      "geary"
      "htop"
      "starship"
      "vim"
    ];
    mkEnabled = name: { ${name}.enable = true; };
  in builtins.foldl' (acc: name: acc // (mkEnabled name)) {
    bash = {
      blesh.enable = true;
      completion.enable = true;
      interactiveShellInit = "source \"$XDG_CONFIG_HOME/bash/rc.bash\"";
      vteIntegration = true;
      shellAliases = {
        cat = "bat -n";
        cp = "cp -v";
        ls = "eza -F -Ghl --git --icons";
        mkdir = "mkdir -v";
        mv = "mv -v";
        rm = "trash-put -v";
      };
    };
    git = {
      enable = true;
      lfs.enable = true;
    };
    gnupg.agent.enable = true;
    firefox.preferences = {
      enable = true;
      browser = {
        tabs.groups.enabled = true;
        quitShortcut.disabled = true;
      };
    };
    npm = {
      npmrc = ''
        prefix=${globalVariables.xdgDataHome}/npm
        cache=${globalVariables.xdgCacheHome}/npm
        init-module=${globalVariables.xdgConfigHome}/npm/config/npm-init.js
        tmp=/tmp/npm
      '';
    };
    regreet = with pkgs; {
      enable = true;
      cursorTheme = {
        name = "Posy_Cursor";
        package = posy-cursors;
      };
      font = {
        name = "Source Sans 3";
        package = source-sans;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = papirus-icon-theme;
      };
      theme = {
        name = "Materia-dark";
        package = materia-theme;
      };
      settings = {
        background.path = globalVariables.background;
      };
    };
    steam = {
      enable = true;
      presence = {
        enable = true;
        steamApiKeyFile = "/ssdata/private/secrets/steam-presence/steam";
        userIds = [ "76561199734028422" ];
        coverArt.steamGridDB = {
          enable = true;
          apiKeyFile = "/ssdata/private/secrets/steam-presence/steamgriddb";
        };
      };
    };
  } enabled;

  environment = {
    systemPackages = let
      unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

      consolePackages = with pkgs; [
        eza
        jq
        imagemagick
        nil
        steam-run
        tealdeer
        trash-cli
        wl-clipboard
      ];

      desktopPackages = with pkgs; [
        gnomeExtensions.appindicator
        gnomeExtensions.auto-move-windows
        gnomeExtensions.just-perfection
        gnomeExtensions.workspaces-indicator-by-open-apps
        hunspell
        hunspellDicts.en_GB-ise
        hunspellDicts.en_US
        hunspellDicts.uk_UA
        materia-theme
        papirus-icon-theme
        posy-cursors
      ];

      programPackages = with pkgs; [
        baobab
        cartridges
        celluloid
        dconf-editor
        emacs30-pgtk
        eog
        unstable.ghostty
        gimp
        gnome-calculator
        gnome-tweaks
        inkscape
        libreoffice
        nautilus
        nicotine-plus
        rhythmbox
        telegram-desktop
        transmission_4-gtk
        vesktop
        zoom-us
      ];

    in builtins.concatLists [
      consolePackages
      desktopPackages
      programPackages
    ];
  };
}
