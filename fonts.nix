{ pkgs, inputs, ... }:

{
  fontconfig = {
    defaultFonts = {
      sansSerif = [
        "Source Sans 3"
        "Source Han Sans"
        "Liberation Sans"
      ];
      serif = [
        "Source Serif 4"
        "Source Han Serif"
        "Liberation Serif"
      ];
      monospace = [
        "FantasqueSansM Nerd Font"
        "DeJavu Sans Mono"
      ];
      emoji = [
        "Twitter Color Emoji"
      ];
    };
  };

  packages =
    let
      _unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
    in
    with pkgs;
    [
      nerd-fonts.fantasque-sans-mono
      noto-fonts
      source-sans
      source-han-sans
      source-serif
      source-han-serif
      twitter-color-emoji
    ];
}
