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

  fonts.packages = 
    let unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
    in with pkgs; [
      noto-fonts
      source-han-sans
      source-han-serif
      source-sans
      source-serif
      twitter-color-emoji
      unstable.nerd-fonts.iosevka
    ];

  programs = let
    enabled = [
      "bat"
      "evince"
      "file-roller"
      "firefox"
      "geary"
      "git"
      "htop"
      "starship"
      "steam"
      "vim"
      "zsh"
    ];
    mkEnabled = name: { ${name}.enable = true; };
  in builtins.foldl' (acc: name: acc // (mkEnabled name)) {
    git.lfs.enable = true;
    gnupg.agent.enable = true;
    firefox.preferences = {
      "browser.tabs.groups.enabled" = true;
    };
  } enabled;

  environment = {
    systemPackages = let
      _unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

      consolePackages = with pkgs; [
        binutils
        eza
        gcc
        gnumake
        imagemagick
        linuxHeaders
        nil
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
        materia-theme
        papirus-icon-theme
        posy-cursors
      ];

      programPackages = with pkgs; [
        baobab
        celluloid
        emacs30-pgtk
        eog
        ghostty
        gimp
        gnome-calculator
        helvum
        inkscape
        libreoffice-still
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
