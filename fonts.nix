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
      monospace = [ "Iosevka Nerd Font" ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };

  packages =
    let
      _unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
    in
    with pkgs;
    [
      nerd-fonts.iosevka
      noto-fonts
      source-sans
      source-han-sans
      source-serif
      source-han-serif
      twitter-color-emoji
    ];
}
