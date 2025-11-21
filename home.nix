{ lib, globalVariables, ... }:

{
  home = {
    username = "orest";
    homeDirectory = "/home/orest";
    stateVersion = "24.11"; # Don't change!
  };

  dconf.settings = import ./dconf.nix { inherit lib globalVariables; };
}
