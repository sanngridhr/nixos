{ pkgs, inputs, ... }:

{
  nix = {
    package = pkgs.lix;
    
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      use-xdg-base-directories = true;
    };
  };

  nixpkgs.config.allowUnfree = true;
  
  programs = let
    enabled = [
      "bat"
      "evince"
      "file-roller"
      "firefox"
      "geary"
      "htop"
      "steam"
      "vim"
    ];
    mkEnabled = name: { ${name}.enable = true; };
  in builtins.foldl' (acc: name: acc // (mkEnabled name)) {
    git = {
      enable = true;
      lfs.enable = true;
    };
    gnupg.agent.enable = true;
    firefox.preferences = {
      enable = true;
      "browser.tabs.groups.enabled" = true;
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
    };
  } enabled;

  environment = {
    systemPackages = let
      _unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

      consolePackages = with pkgs; [
        binutils
        elvish
        eza
        gcc
        gnumake
        imagemagick
        linuxHeaders
        nil
        starship
        steam-run
        tealdeer
        trash-cli
        unar
        wineWowPackages.wayland
        wl-clipboard
        yt-dlp
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
        ario
        baobab
        celluloid
        emacs30-pgtk
        eog
        ghostty
        gimp
        gnome-calculator
        gnome-tweaks
        helvum
        inkscape
        libreoffice-still
        nautilus
        nicotine-plus
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
