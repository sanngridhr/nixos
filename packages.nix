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
      interactiveShellInit = "export HISTFILE=${globalVariables.xdgStateHome}/bash/bashhist";
      vteIntegration = true;
      shellAliases = {
        cat = "bat";
        cp = "cp -v";
        ls = "eza -F -Ghl --git --icons";
        mkdir = "mkdir -v";
        mv = "mv -v";
        rm = "trash-put -v";
        nrs = "nixos-rebuild switch --use-remote-sudo --log-format multiline-with-logs";
        ga = "git add .";
        gc = "git commit";
        gch = "git checkout";
        gp = "git push";
        gpl = "git pull";
        grep = "greep -ni --color";
      };
    };
    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [
        batman
      ];
      settings = {
        italic-text = "always";
        style = "full";
        map-syntax = [
          "\.?bashhist:\"Bourne Again Shell (bash)\""
        ];
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
    systemPackages = with pkgs; let
      unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

      consolePackages = [
        eza
        jq
        imagemagick
        nil
        steam-run
        tealdeer
        texlivePackages.fontspec
        texlivePackages.wrapfig
        trash-cli
        wl-clipboard
      ];
      
      desktopPackages = [
        materia-theme
        papirus-icon-theme
        posy-cursors
      ];

      gnomePackages = with gnomeExtensions; [
        appindicator
        auto-move-windows
        just-perfection
        workspaces-indicator-by-open-apps
      ];

      programPackages = [
        baobab
        cartridges
        celluloid
        dconf-editor
        emacs-pgtk
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
        sleepy-launcher
        telegram-desktop
        transmission_4-gtk
        vesktop
        zoom-us
      ];

      hunspell = hunspellWithDicts [
        hunspellDicts.en_GB-ise
        hunspellDicts.en_US
        hunspellDicts.uk_UA
      ];

      texlive = texliveBasic.withPackages (ps: with ps; [
        capt-of
        fontspec
        latexmk
        ulem
        wrapfig
      ]);

    in builtins.concatLists [
      consolePackages
      desktopPackages
      gnomePackages
      programPackages
    ] ++ [
      hunspell
      texlive
    ];
  };
}
