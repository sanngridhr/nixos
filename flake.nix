{
  inputs = {
    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    nixos-hardware.url   = "github:NixOS/nixos-hardware";

    home-manager = {
      url                    = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      nixos-hardware = inputs.nixos-hardware.nixosModules;
    in {
      nixosConfigurations.GLaDOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { networking.hostName = "GLaDOS"; }
          nixos-hardware.common-cpu-amd
          nixos-hardware.common-gpu-amd
          home-manager.nixosModules.home-manager 
          ./configuration.nix
          ./GLaDOS-hardware
        ];
      };

      nixosConfigurations.Adventure = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { networking.hostName = "Adventure"; }
          nixos-hardware.lenovo-thinkpad-t480s
          home-manager.nixosModules.home-manager 
          ./configuration.nix
          ./Adventure-hardware
        ];
      };
    };
}
