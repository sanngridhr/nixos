{
  inputs = {
    home-manager = {
      url                    = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixos-hardware.url   = "github:NixOS/nixos-hardware";

    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nixpkgs, ... }@inputs:
    let
      nixos-hardware = inputs.nixos-hardware.nixosModules;

      commonModules = [
        ./configuration.nix
        ./packages.nix
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            backupFileExtension = "bak";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.orest = import ./home.nix;
          };
        } 
      ];
    in {
      nixosConfigurations = {
        GLaDOS = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = commonModules ++ [
            { networking.hostName = "GLaDOS"; }
            ./hardware/GLaDOS.nix
            nixos-hardware.common-cpu-amd
            nixos-hardware.common-gpu-amd
          ];
        };

        Adventure = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = commonModules ++ [
            { networking.hostName = "Adventure"; }
            ./hardware/Adventure.nix
            nixos-hardware.lenovo-thinkpad-t480s
          ];
        };
      };
    };
}
