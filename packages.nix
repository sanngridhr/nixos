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
      "evince"
      "file-roller"
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
    firefox = {
      enable = true;
      preferences = {
        "browser.tabs.groups.enabled" = true;
      };
    };
  } enabled;
  
  services.emacs = {
    enable = true;
    install = true;
    package = pkgs.emacs30-pgtk;
  };

  environment = {
    systemPackages = let
      unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

      consolePackages = with pkgs; [
        bat
        binutils
        eza
        gcc
        gnumake
        imagemagick
        linuxHeaders
        nil
        ruff
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
        gnomeExtensions.just-perfection
        materia-theme
        papirus-icon-theme
        posy-cursors
      ];

      programPackages = with pkgs; [
        baobab
        celluloid
        eog
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
        unstable.ghostty
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
