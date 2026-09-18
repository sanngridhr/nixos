## skin-manifest.nix
##
## Builds the attrset that becomes skin.json. Shape verified against the
## real SteamClientHomebrew/ThemeTemplate skin.json (2026-09) — keep this in
## sync if Millennium's manifest shape changes upstream; nothing here is
## guessed, it mirrors that file field-for-field.

{
  name,
  description,
  version ? "1.0.0",
  webkit ? "webkit.css",
}:
{
  inherit name description version;
  author = "Sanngriðr";
  "Steam-WebKit" = webkit;
  UseDefaultPatches = true;
  tags = [
    "Flexoki"
    "Nix-generated"
  ];
}
