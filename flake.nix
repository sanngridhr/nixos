{
  inputs = {
    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url   = "github:NixOS/nixos-hardware";

    home-manager = {
      url                    = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    fjordlauncher.url = "github:unmojang/FjordLauncher";
  };

  nixConfig.extra-experimental-features = [ "pipe-operators" ];
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      # motherboard = with builtins; replaceStrings [ " " "\n" "\t" ] [ "_" "" "" ]
      #   (readFile "/sys/devices/virtual/dmi/id/product_name");
      motherboard = "20L8S7GJ05";
      nixos-hardware = inputs.nixos-hardware.nixosModules;
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.orest = import ./home.nix;
          }
        ] ++ ( if motherboard == "MS-7C51"    then [
          ./MS-7C51.nix
          nixos-hardware.common-cpu-amd
          nixos-hardware.common-gpu-amd
        ] else if motherboard == "20L8S7GJ05" then [
          nixos-hardware.lenovo-thinkpad-t480s
        ] else []
        ) ++ builtins.trace "Motherboard: `${motherboard}`" [];
      };
    };
}
