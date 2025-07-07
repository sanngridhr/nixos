{ pkgs, inputs, ... }:

{ 
  fontconfig = {
    defaultFonts = {
      sansSerif = [ "Source Sans 3" ];
      serif = [ "Source Serif 4" ];
      monospace = [ "Iosevka Nerd Font" ];
      emoji = [ "Twitter Color Emoji" ];
    };
  };
  
  packages = 
    let _unstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
    in with pkgs; [
      nerd-fonts.iosevka
      noto-fonts
      source-han-sans
      source-han-serif
      source-sans
      source-serif
      twitter-color-emoji
    ];
}
