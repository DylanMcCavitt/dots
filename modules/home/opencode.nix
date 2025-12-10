{
  pkgs, inputs, ...
} :
let
  opencode = inputs.opencode-flake.packages.${pkgs.system}.opencode;
in {
  home.packages = [ opencode ];
  }
