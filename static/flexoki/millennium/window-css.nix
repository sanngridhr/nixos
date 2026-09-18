## window-css.nix — thin assembler for Millennium per-window CSS files.
##
## Each area lives in its own part file under css/. This file only injects
## `:root` vars and concatenates the parts per window. Part contents are
## pure CSS strings; only foundation needs `variant` (for its header
## comment).
##
## Area → file mapping (all Steam-styled, Flexoki colors only):
##   foundation → css/foundation-css.nix (all windows incl. popup menu layer)
##   library    → css/library-css.nix    (libraryroot shell)
##   sidebar    → css/sidebar-css.nix    (left list detail)
##   gamepage   → css/gamepage-css.nix   (game details detail)
##
## friends / bigpicture stay foundation-only until live DOM dumps land.

{
  rootVars,
  window,
  variant ? "dark",
  palette ? null,
}:
let
  foundation = import ./css/foundation-css.nix { inherit variant; };
  library = import ./css/library-css.nix;
  sidebar = import ./css/sidebar-css.nix;
  gamepage = import ./css/gamepage-css.nix;

  perWindow =
    if window == "libraryroot" then library + "\n" + sidebar + "\n" + gamepage
    else if window == "webkit" then "/* webkit: foundation only. */"
    else "/* ${window}: foundation only until a live DOM dump lands. */";
in
''
  :root {
  ${rootVars}
  }

  ${foundation}

  ${perWindow}
''
