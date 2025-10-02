{ pkgs, inputs, ... }:

{
  boot = {
    crashDump.enable = true;
    
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
      };
    };

    plymouth = {
      enable = true;
      font = "${pkgs.source-sans}/share/fonts/truetype/SourceSans3-Regular.ttf";
    };
  };

  environment.sessionVariables = rec {
    EDITOR = "emacs -nw";
    MANPAGER = "bat -l man -p";
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

    XDG_CACHE_HOME = "$HOME/.cache";
    
    XDG_CONFIG_HOME = "$HOME/.config";
    "_JAVA_OPTIONS" = "-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java";
    DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";
    JAVA_TOOL_OPTIONS = "-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java";
    
    XDG_DATA_HOME = "$HOME/.local/share";
    GNUPGHOME = "${XDG_DATA_HOME}/gnupg";
    SONARLINT_USER_HOME = "${XDG_DATA_HOME}/sonarlint";

    XDG_STATE_HOME = "$HOME/.local/state";
  };
  
  fonts = import ./fonts.nix { inherit pkgs inputs; };
  
  hardware = {
    enableAllFirmware = true;
    keyboard.qmk.enable = true;
  };

  i18n = {
    defaultLocale = "uk_UA.UTF-8";

    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
    };
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [  ];
      allowedUDPPorts = [  ];
    };

    networkmanager.enable = true;
  };
  
  qt = {
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  services = let
    secrets_dir = "/ssdata/secrets";
  in {
    gnome.core-apps.enable = false;
    
    mpd = {
      enable = true;
      credentials = [
        {
          passwordFile = "${secrets_dir}/mpd/password";
          permissions = [ "read" "add" "control" ];
        }
      ];
      musicDirectory = "/ssdata/music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
      startWhenNeeded = true;
    };

    mpdscribble = {
      enable = true;
      endpoints = {
        "last.fm" = {
          username = "orest58008";
          passwordFile = "${secrets_dir}/mpdscribble/last.fm/password";
        };
      };
    };
    
    openssh = {
      enable = true;
      openFirewall = true;
      ports = [ 22 ];
      settings.PermitRootLogin = "no";
    };
    
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    
    pulseaudio.enable = false;

    udev.packages = with pkgs; [
      gnome-settings-daemon
    ];

    xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm xorg.xprop ];

      desktopManager.gnome.enable = true;
    };

    yggdrasil.enable = true;
  };

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults env_reset,pwfeedback
    Defaults env_keep += \"EDITOR VIMINIT XDG_CONFIG_HOME XDG_STATE_HOME\"";
  };

  systemd.services.mpd = {
    serviceConfig = {
      ReadWritePaths = "/ssdata/secrets/mpd";
    };
  };
  
  time.timeZone = "Europe/Kyiv";

  users.users.orest = {
    isNormalUser = true;
    description = "Орест";
    extraGroups = [ "docker" "networkmanager" "wheel" "input" ];
    shell = pkgs.elvish;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  xdg.portal.enable = true;
  
  system.stateVersion = "24.11"; # Don't change!
}
