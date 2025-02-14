{
  inputs = {
    dotfiles.url = "github:orest58008/config";
    
    home-manager = {
      url                    = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixos-hardware.url   = "github:NixOS/nixos-hardware";

    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nixpkgs, dotfiles, home-manager, ... }@inputs:
    let
      nixos-hardware = inputs.nixos-hardware.nixosModules;
    in {
      nixosConfigurations.GLaDOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs dotfiles; };
        modules = [
          { networking.hostName = "GLaDOS"; }
          nixos-hardware.common-cpu-amd
          nixos-hardware.common-gpu-amd
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit dotfiles; };
          } 
          ./configuration.nix
          ./GLaDOS-hardware.nix
        ];
      };

      nixosConfigurations.Adventure = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs dotfiles; };
        modules = [
          { networking.hostName = "Adventure"; }
          nixos-hardware.lenovo-thinkpad-t480s
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit dotfiles; };
          }
          ./configuration.nix
          ./Adventure-hardware.nix
        ];
      };
    };
}
