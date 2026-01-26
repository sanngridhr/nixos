{ pkgs, inputs, globalVariables, ... }:

{
  boot = {
    crashDump.enable = true;

    kernelPackages = pkgs.linuxPackages_zen;
    
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
        memtest86.enable = true;
      };
    };

    plymouth = {
      enable = true;
      font = "${pkgs.source-sans}/share/fonts/truetype/SourceSans3-Regular.ttf";
    };
  };

  environment.sessionVariables = rec {
    EDITOR = "nvim";
    GTK_USE_PORTAL = 1;
    LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    MANPAGER = "batman";
    NIXOS_OZONE_WL = 1;
    QT_QPA_PLATFORM = "wayland";

    XDG_CACHE_HOME = globalVariables.xdgCacheHome;
    NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm";
    
    XDG_CONFIG_HOME = globalVariables.xdgConfigHome;
    "_JAVA_OPTIONS" = "-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java";
    DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";
    JAVA_TOOL_OPTIONS = "-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java";
    PYTHONSTARTUP = "${XDG_CONFIG_HOME}/python/rc.py";
    GVIMINIT=''source "${XDG_CONFIG_HOME}/vim/gvimrc"'';
    VIMINIT=''source "${XDG_CONFIG_HOME}/vim/vimrc"'';
    NPM_CONFIG_INIT_MODULE="${XDG_CONFIG_HOME}/npm/config/npm-init.js";
    
    XDG_DATA_HOME = globalVariables.xdgDataHome;
    DOTNET_CLI_HOME="${XDG_DATA_HOME}/dotnet";
    GNUPGHOME = "${XDG_DATA_HOME}/gnupg";
    SONARLINT_USER_HOME = "${XDG_DATA_HOME}/sonarlint";

    XDG_STATE_HOME = globalVariables.xdgStateHome;

    NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
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
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    gnome.core-apps.enable = false;
    
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
  };

  security = {
    rtkit.enable = true;
    sudo.extraConfig = "Defaults env_reset,pwfeedback
    Defaults env_keep += \"EDITOR VIMINIT XDG_CONFIG_HOME XDG_STATE_HOME\"";
  };

  swapDevices = [ { device = "/dev/disk/by-label/SWAP"; } ];
  
  time.timeZone = "Europe/Kyiv";

  users.users.orest = {
    isNormalUser = true;
    description = "Орест";
    extraGroups = [ "docker" "networkmanager" "wheel" "input" ];
    shell = pkgs.bash;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    extraPackages = with pkgs; [ docker-buildx ];
    storageDriver = "overlay2";
  };

  xdg = {
    icons.fallbackCursorThemes = [ "Posy_Cursor" ];
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };
  
  system.stateVersion = "24.11"; # Don't change!
}
