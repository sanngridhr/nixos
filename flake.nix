{
  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    steam-presence.url = "github:JustTemmie/steam-presence";
    steam-presence.inputs.nixpkgs.follows = "nixpkgs";
    
    nixos-hardware.url   = "github:NixOS/nixos-hardware";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url          = "github:NixOS/nixpkgs/nixos-25.11";
  };
  
  outputs = { self, nixpkgs, ... }@inputs:
    let
      nixos-hardware = inputs.nixos-hardware.nixosModules;

      globalVariables = {
        background = ./static/wallpapers/122259941_p0.jpg;
        xdgCacheHome = "$HOME/.cache";
        xdgConfigHome = "$HOME/.config";
        xdgDataHome = "$HOME/.local/share";
        xdgStateHome = "$HOME/.local/state";
      };
      
      commonModules = [
        ./configuration.nix
        ./packages.nix
        inputs.home-manager.nixosModules.home-manager {
          home-manager = {
            backupFileExtension = "bak";
            extraSpecialArgs = { inherit globalVariables; };
            useGlobalPkgs = true;
            useUserPackages = true;
            users.orest = import ./home.nix;
          };
        } 
      ];
    in {
      nixosConfigurations = {
        GLaDOS = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs globalVariables; };
          modules = commonModules ++ [
            ./hardware/GLaDOS.nix
            nixos-hardware.common-cpu-amd
            nixos-hardware.common-gpu-amd
          ];
        };

        Adventure = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs globalVariables; };
          modules = commonModules ++ [
            ./hardware/Adventure.nix
            nixos-hardware.lenovo-thinkpad-t480s
          ];
        };
      };
    };
}
