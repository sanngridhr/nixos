# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

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

  hardware = {
    enableAllFirmware = true;
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
      allowedTCPPorts = [ 80 8000 8080 ];
      allowedUDPPorts = [  ];
    };

    networkmanager.enable = true;
  };

  qt = {
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  services = {
    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix;
      };
    };
    
    gnome.core-apps.enable = false;

    openssh = {
      enable = true;
      openFirewall = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
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
      displayManager.gdm.enable = true;
    };

    yggdrasil.enable = true;
  };

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults env_reset,pwfeedback
    Defaults env_keep += \"EDITOR VIMINIT XDG_CONFIG_HOME XDG_STATE_HOME\"";
  };
  
  time.timeZone = "Europe/Kyiv";

  users.users.orest = {
    isNormalUser = true;
    description = "Орест";
    extraGroups = [ "docker" "networkmanager" "wheel" "input" ];
    shell = pkgs.zsh;
  };

  virtualisation.docker.enable = true;

  xdg.portal.enable = true;
  
  system.stateVersion = "24.11"; # Don't change!
}
