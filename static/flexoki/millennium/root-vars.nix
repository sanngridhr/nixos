## root-vars.nix
##
## Turns one variant of the shared palette into a block of CSS custom
## properties. Deliberately generic — it iterates whatever keys exist in
## palette.${variant} rather than hardcoding names, so it can't drift out
## of sync with ../palette.nix as that file evolves for the VS Code theme.
##
## Nix attr names use `_` where the palette needs `-` (e.g. `ye_600`);
## this restores real dashes for the CSS var name (`--flexoki-ye-600`).
##
## On top of the raw vars, this emits semantic aliases (bg, accent, link,
## warn, error, ...) derived from the same palette attrset — no hardcoded
## hex, so light/dark stay consistent with the VS Code theme. Choice locked
## in 2026-09: Green Play / Blue links.

{ lib }:
palette: variant:
let
  p = palette.${variant};
  toCssName = name: lib.replaceStrings [ "_" ] [ "-" ] name;
  raw = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: value: "  --flexoki-${toCssName name}: ${value};") p
  );
  semantic = ''
    /* Semantic aliases — derived from palette, Green Play / Blue links. */
      --flexoki-bg: ${p.bg};
      --flexoki-bg-2: ${p.bg_2};
      --flexoki-ui: ${p.ui};
      --flexoki-ui-2: ${p.ui_2};
      --flexoki-ui-3: ${p.ui_3};
      --flexoki-tx: ${p.tx};
      --flexoki-tx-2: ${p.tx_2};
      --flexoki-tx-3: ${p.tx_3};
      --flexoki-accent: ${p.gr};
      --flexoki-accent-2: ${p.cy};
      --flexoki-link: ${p.bl};
      --flexoki-warn: ${p.or};
      --flexoki-error: ${p.re};
      --flexoki-play-text: ${p.bg};'';
in
raw + "\n" + semantic
