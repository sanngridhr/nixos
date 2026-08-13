# Builds the Flexoki VS Code extension source directory from a single
# palette + template, generating both Flexoki-Light-color-theme.json and
# Flexoki-Dark-color-theme.json at Nix evaluation/build time.
#
# Usage (e.g. in packages.nix):
#   src = import ./static/flexoki-vscode { inherit pkgs; };
{ pkgs }:
let
  palette = import ./palette.nix;
  theme = import ./theme-template.nix;

  lightTheme = theme "light" palette.light;
  darkTheme = theme "dark" palette.dark;

  lightJson = pkgs.writeText "Flexoki-Light-color-theme.json"
    (builtins.toJSON lightTheme);
  darkJson = pkgs.writeText "Flexoki-Dark-color-theme.json"
    (builtins.toJSON darkTheme);
in pkgs.runCommand "flexoki-vscode-src" { } ''
  mkdir -p $out
  cp ${./package.json} $out/package.json
  cp ${lightJson} $out/Flexoki-Light-color-theme.json
  cp ${darkJson} $out/Flexoki-Dark-color-theme.json
''
