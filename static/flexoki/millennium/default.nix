## default.nix — Millennium Steam theme, generated from the shared Flexoki palette.
##
## Mirrors the vscode build: ../palette.nix stays the single source of
## truth, this just projects it into Millennium's skin.json + CSS shape
## instead of VS Code's theme JSON. Same builtins.toJSON + runCommand
## pattern, no build tooling.
##
## Usage (e.g. in home.nix):
##
##   (import ./static/flexoki/millennium { inherit pkgs; }).dark
##
## Result is { dark = <derivation>; light = <derivation>; } — each a full
## skin folder. Wire each one up separately, e.g. via home-manager:
##
##   xdg.dataFile."Steam/steamui/skins/flexoki-dark".source =
##     (import ./static/flexoki/millennium { inherit pkgs; }).dark;
##
## Confirm the real skins path for steamWithMillennium on your machine
## first — the ~/.steam/steam/steamui/skins path in Millennium's own docs
## is for the tarball install, and may not match the nixpkgs package.

{
  pkgs,
  lib ? pkgs.lib,
}:
let
  palette = import ../palette.nix;
  mkRootVars = import ./root-vars.nix { inherit lib; };
  mkManifest = import ./skin-manifest.nix;
  mkWindowCss = import ./window-css.nix;

  variantName = variant: if variant == "dark" then "Flexoki Dark" else "Flexoki Light";

  mkTheme =
    variant:
    let
      rootVars = mkRootVars palette variant;

      manifest = mkManifest {
        name = variantName variant;
        description = "Flexoki (${variant}) for Steam, generated from the shared palette.";
      };

      webkitCss = ''
        :root {
        ${rootVars}
        }

        /* webkit.css — global overrides.
         * TODO: real selectors from live Steam inspection (see window-css.nix).
         */
      '';

      windowCss = window: mkWindowCss { inherit rootVars window; };
    in
    pkgs.runCommand "millennium-flexoki-${variant}" { } ''
            mkdir -p "$out"

            cat > "$out/skin.json" <<'EOF'
      ${builtins.toJSON manifest}
      EOF

            cat > "$out/webkit.css" <<'EOF'
      ${webkitCss}
      EOF

            cat > "$out/libraryroot.custom.css" <<'EOF'
      ${windowCss "libraryroot"}
      EOF

            cat > "$out/friends.custom.css" <<'EOF'
      ${windowCss "friends"}
      EOF

            cat > "$out/bigpicture.custom.css" <<'EOF'
      ${windowCss "bigpicture"}
      EOF
    '';
in
{
  dark = mkTheme "dark";
  light = mkTheme "light";
}
