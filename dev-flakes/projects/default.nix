{ pkgs }:
let
  node-astro = import ./node-astro.nix { inherit pkgs; };
  node-backend = import ./node-backend.nix { inherit pkgs; };
in {
  inherit
    node-astro
    node-backend;
}

