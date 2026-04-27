{
  pkgs,
  lib,
  inputs,
  globalVariables,
  ...
}:

{
  imports = [
    inputs.steam-presence.nixosModules.steam-presence
  ];

  nix = {
    package = pkgs.lix;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operator"
      ];
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
      trusted-users = [ "@wheel" ];
      use-xdg-base-directories = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs =
    let
      vscodeUnpack = ''
        runHook preUnpack
        cp -r $src/* .
        runHook postUnpack
      '';
      enabled = [
        "evince"
        "firefox"
        "geary"
        "gpaste"
        "htop"
        "xwayland"
        "zoom-us"
      ];
      mkEnabled = name: { ${name}.enable = true; };
    in
    builtins.foldl' (acc: name: acc // (mkEnabled name)) {
      bash = {
        blesh.enable = true;
        completion.enable = true;
        interactiveShellInit = ''
          export HISTFILE=$XDG_STATE_HOME/bash/bashhist
          export HISTCONTROL=ignorespace:erasedups
          export HISTSIZE=
          export HISTFILESIZE=
          fumbbl() {
            nix-shell -p 'python3 openjdk8 adwaita-icon-theme adoptopenjdk-icedtea-web' \\
            --run "python3 /data/build/fumbbl/launch.py \"$1\""
          }
        '';
        vteIntegration = true;
        shellAliases = {
          cat = "bat";
          cp = "cp -v";
          ga = "git add .";
          gc = "git commit";
          gch = "git checkout";
          gp = "git push";
          gpl = "git pull";
          grep = "grep -ni --color";
          ls = "eza -F -Ghl --git --icons";
          mkdir = "mkdir -pv";
          mv = "mv -v";
          nrs = "nixos-rebuild switch --sudo --log-format multiline-with-logs";
          q = "exit";
          rm = "trash-put -v";
          t503d = "nix-shell -p 'python3.withPackages (ps: [ ps.evdev ps.pyusb ps.pyyaml ])' \\
                 --run 'sudo python3 /data/build/10moons-t503-driver/driver.py'";
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
        "browser.tabs.groups.enabled" = true;
        "browser.quitShortcut.disabled" = true;
      };
      neovim = {
        enable = true;
        defaultEditor = true;
        withRuby = false;
        withPython3 = false;
      };
      npm = {
        npmrc = ''
          prefix=${globalVariables.xdgDataHome}/npm
          cache=${globalVariables.xdgCacheHome}/npm
          init-module=${globalVariables.xdgConfigHome}/npm/config/npm-init.js
          tmp=/tmp/npm
        '';
      };
      starship = {
        enable = true;
        presets = [ "nerd-font-symbols" "bracketed-segments" ];
        settings = {
          cmd_duration.format = "\\[[󱎫 $duration]($style)\\]";
          package.symbol = "󰏓 ";
          character = {
            success_symbol = "[>](bold green)";
            error_symbol = "[>](bold red)";
          };
          custom.make = {
            symbol = " ";
            detect_files = [ "GNUmakefile" "makefile" "Makefile" ];
            style = "bold yellow";
            format = "\\[[via $symbol($output )]($style)\\]";
          };
          git_status = {
            ahead = "->";
            behind = "<-";
            diverged = "←→";
            deleted = "×";
            staged = "*";
          };
          sudo = {
            symbol = " ";
            disabled = false;
          };
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
      vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
          charliermarsh.ruff
          dbaeumer.vscode-eslint
          docker.docker
          esbenp.prettier-vscode
          github.vscode-github-actions
          ms-python.mypy-type-checker
          ms-python.python
          ms-python.vscode-pylance
          tamasfe.even-better-toml
          vscodevim.vim
          (pkgs.vscode-utils.buildVscodeExtension {
            pname = "flexoki-theme";

            src = ./static/flexoki-vscode;
            sourceRoot = ".";
            unpackPhase = vscodeUnpack;

            vscodeExtName = "flexoki-theme";
            vscodeExtPublisher = "localhost";
            vscodeExtUniqueId = "localhost.flexoki-theme";
            version = "1.0.0";
          })
        ];
      };
    } enabled;

  environment = {
    systemPackages =
      with pkgs;
      let
        unstable = import inputs.nixpkgs-unstable {
          system = pkgs.stdenv.hostPlatform.system;
          config.allowUnfree = true;
        };

        consolePackages = [
          eza
          fd
          imagemagick
          jq
          mupdf
          sccache
          tealdeer
          trash-cli
        ];

        desktopPackages = [
          materia-theme
          papirus-icon-theme
          posy-cursors
          wl-clipboard
        ];

        devPackages = [
          unstable.code-cursor
          emacs-pgtk
          gnumake
          nil
          nodejs
          python314
          ruff
        ];

        gnomePackages = with gnomeExtensions; [
          appindicator
          auto-move-windows
          native-window-placement
          top-bar-organizer
          vitals
          workspaces-indicator-by-open-apps
        ];

        programPackages = [
          baobab
          celluloid
          dconf-editor
          eog
          file-roller
          foliate
          unstable.ghostty
          gimp
          gnome-calculator
          gnome-tweaks
          helvum
          inkscape
          libreoffice
          nautilus
          nicotine-plus
          rhythmbox
          unstable.telegram-desktop
          transmission_4-gtk
          vesktop
        ];

        hunspell' = hunspell.withDicts (
          ds: with ds; [
            en_GB-ise
            en_US
            uk_UA
          ]
        );

        texlive' = texliveBasic.withPackages (
          ps: with ps; [
            booktabs
            capt-of
            footnotehyper
            lualatex-math
            ulem
            unicode-math
            wrapfig
            xcolor
          ]
        );

      in
      builtins.concatLists [
        consolePackages
        desktopPackages
        devPackages
        gnomePackages
        programPackages
      ]
      ++ [
        hunspell'
        texlive'
      ];
  };
}
