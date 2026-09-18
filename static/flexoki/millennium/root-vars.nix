## root-vars.nix
##
## Turns one variant of the shared palette into a block of CSS custom
## properties. Deliberately generic — it iterates whatever keys exist in
## palette.${variant} rather than hardcoding names, so it can't drift out
## of sync with ../palette.nix as that file evolves for the VS Code theme.
##
## Nix attr names use `_` where the palette needs `-` (e.g. `ye_600`);
## this restores real dashes for the CSS var name (`--flexoki-ye-600`).

{ lib }:
palette: variant:
let
  p = palette.${variant};
  toCssName = name: lib.replaceStrings [ "_" ] [ "-" ] name;
in
lib.concatStringsSep "\n" (
  lib.mapAttrsToList (name: value: "  --flexoki-${toCssName name}: ${value};") p
)
