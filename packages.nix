{ pkgs, inputs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      randomizedDelaySec = "1d";
    };
    package = pkgs.lix;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operator"
      ];
      use-xdg-base-directories = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    firefox.enable = true;
    gnupg.agent.enable = true;
    steam.enable = true;
    zsh.enable = true;
  };

  environment = {
    systemPackages = let
      unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

      consolePackages = with pkgs; [
        bat
        eza
        gcc
        git
        gnumake
        gnupg
        htop
        imagemagick
        starship
        steam-run
        tealdeer
        trash-cli
        vim
        wl-clipboard
        zsh
      ];

      desktopPackages = with pkgs; [
        gnomeExtensions.appindicator
        gnomeExtensions.just-perfection
        materia-theme
        papirus-icon-theme
        posy-cursors
      ];

      devPackages = with pkgs; [
        deno
        emacs29-pgtk
        ocamlPackages.ocaml-lsp
        ocamlPackages.ocamlformat
        python3Packages.jedi-language-server
        nil
        python3
        ruff
        texliveMedium
      ];

      programPackages = with pkgs; [
        abiword
        baobab
        celluloid
        cheese
        dconf-editor
        eog
        evince
        file-roller
        geary
        gimp
        gnome-calculator
        gnome-sound-recorder
        inkscape
        libreoffice-still
        nautilus
        nicotine-plus
        obs-studio
        rhythmbox
        telegram-desktop
        transmission_4-gtk
        unstable.ghostty
        vesktop
        zoom-us
      ];

      servicePackages = with pkgs; [
        alsa-utils
        binutils
        linuxHeaders
        wineWowPackages.wayland
      ];

    in builtins.concatLists [
      consolePackages
      desktopPackages
      devPackages
      programPackages
      servicePackages
    ];
  };
}
