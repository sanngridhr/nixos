{ config, lib, modulesPath, pkgs, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
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

    "/data" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = [ "noatime" "compress=zstd" "subvol=@data" ];
    };
  };

  networking.hostName = "Adventure";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
