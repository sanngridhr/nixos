{ config, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [(final: prev: {
    python-validity = prev.python3Packages.buildPythonApplication rec {
      pname = "python-validity";
      version = "git";
      src = inputs.python-validity;

      pyproject = true;
      build-system = with prev.python3Packages; [ setuptools ];
      
      propagatedBuildInputs = with prev.python3Packages; [
        cryptography
        pyusb
        pyyaml
        dbus-python
        pygobject3
      ];

      postInstall = ''
        sitePackages="$out/${prev.python3.sitePackages}"
        
        mkdir -p "$out/libexec"
        cp "$src/dbus_service/dbus-service" "$out/libexec/python-validity-dbus-service"
        chmod 755 "$out/libexec/python-validity-dbus-service"
        
        sed -i '/svc = Device(bus, config)/a\    bus.request_name("net.reactivated.Fprint")' "$out/libexec/python-validity-dbus-service"
        
        sed -i '/watcher = bus.watch_name_owner/d' "$out/libexec/python-validity-dbus-service"
        sed -i '/bus.get_object.*net.reactivated.Fprint.*Manager/d' "$out/libexec/python-validity-dbus-service"
        sed -i '/# Kick off the open-fprintd/d' "$out/libexec/python-validity-dbus-service"
        
        install -Dm644 "$src/dbus_service/io.github.uunicorn.Fprint.conf" "$out/etc/dbus-1/system.d/io.github.uunicorn.Fprint.conf"
        
        mkdir -p $out/share/python-validity/playground
        cp -r $src/scripts/* $out/share/python-validity/playground/
        
        pythonPath="${prev.python3Packages.makePythonPath (propagatedBuildInputs ++ [ prev.python3Packages.setuptools ])}:$sitePackages"
        
        makeWrapper ${prev.python3}/bin/python3 $out/bin/validity-factory-reset \
          --add-flags "$out/share/python-validity/playground/factory-reset.py" \
          --prefix PYTHONPATH : "$pythonPath"
        
        makeWrapper "$out/libexec/python-validity-dbus-service" "$out/bin/python3-validity" \
          --prefix PYTHONPATH : "$pythonPath" \
          --prefix PATH : "${prev.python3}/bin" \
          --prefix GI_TYPELIB_PATH : "${prev.gobject-introspection}/lib/girepository-1.0:${prev.glib}/lib/girepository-1.0"
      '';

      nativeBuildInputs = [ prev.makeWrapper ];
    };
  })];

  services.fprintd.enable = false;

  environment.systemPackages = with pkgs; [
    python-validity
    fprintd
    innoextract
  ];

  services.dbus.packages = [ pkgs.python-validity ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="06cb", MODE="0660", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="138a", MODE="0660", GROUP="plugdev"
  '';

  users.groups.plugdev = {};

  systemd.tmpfiles.rules = [
    "d /var/run/python-validity 0755 root root -"
  ];

  systemd.services.fprintd = {
    description = "Fingerprint Authentication Daemon (python-validity)";
    wantedBy = [ "multi-user.target" ];
    after = [ "dbus.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.python-validity}/bin/python3-validity";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  systemd.services.open-fprintd-resume = {
    description = "Open fprintd resume handler";
    wantedBy = [ "suspend.target" ];
    after = [ "suspend.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl restart fprintd";
    };
  };

  systemd.services.open-fprintd-suspend = {
    description = "Open fprintd suspend handler";
    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl stop fprintd";
    };
  };

  security.pam.services = {
    login.fprintAuth = true;
    sudo.fprintAuth = true;
    polkit-1.fprintAuth = true;
  };

  environment.etc."python-validity/dbus-service.yaml".text = ''
    user_to_sid:
        # "myusername": "S-1-5-21-1234567890-1234567890-1234567890-1001"
  '';
}
