{ pkgs, inputs, ... }:

{
  fonts =
    let unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
    in {
      packages = with pkgs; [
        libertinus
        noto-fonts
        source-han-sans
        source-han-serif
        twitter-color-emoji
        unstable.nerd-fonts.iosevka
      ];

      fontconfig = {
        defaultFonts = {
          sansSerif = [ "Libertinus Sans" ];
          serif = [ "Libertinus Serif" ];
          monospace = [ "Iosevka Nerd Font Propo" "Iosevka Extended" ];
          emoji = [ "Twitter Color Emoji" ];
        };
      };
    };
}
