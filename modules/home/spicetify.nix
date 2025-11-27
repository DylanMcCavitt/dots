{
  config,
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;

    spotifyPackage = pkgs.spotify;

    theme = spicePkgs.themes.text;
    colorScheme = "Nord";

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];
  };
}
