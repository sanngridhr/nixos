{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd.availableKernelModules = [ "ahci" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ "kvm-amd" ];
    kernelParams = [ "mem_sleep_default=deep" ];
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = [ "noatime" "compress=zstd" "subvol=@nixos" ];
    };

    "/home" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = [ "noatime" "compress=zstd" "subvol=@home" ];
    };

    "/ssdata" = {
      device = "/dev/disk/by-label/SSDATA";
      fsType = "btrfs";
      options = [ "noatime" "compress=zstd" ];
    };

    "/data" = {
      device = "/dev/disk/by-label/DATA";
      fsType = "btrfs";
      options = [ "noatime" "compress=zstd" "autodefrag" ];
    };
  };

  networking.hostName = "GLaDOS";
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp37s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
