## window-css.nix
##
## Renders one of Millennium's per-window CSS files (webkit / libraryroot /
## friends / bigpicture). Every file gets the same :root custom-property
## block so the palette is available no matter which injection context
## Steam scopes each stylesheet to.
##
## IMPORTANT: the commented section below is a placeholder on purpose.
## Millennium's real selectors/classes aren't documented anywhere reliable —
## ThemeTemplate's own README says to find them by launching Steam with
## `-dev`, opening the inspector (Ctrl+Shift+I), and reading the live DOM.
## Fill the TODO in per window once you've done that on your machine; don't
## trust selectors from elsewhere without checking them against your actual
## running Steam version.

{ rootVars, window }:
''
  :root {
  ${rootVars}
  }

  /* ${window}.custom.css
   * TODO: add real overrides here, using var(--flexoki-<name>) for colors.
   * Selectors must come from inspecting this window live (Ctrl+Shift+I
   * with Steam started via `steam -dev`) — see ThemeTemplate's README.
   */
''
