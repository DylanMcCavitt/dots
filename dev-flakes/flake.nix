{
  description = "shared dev shells";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  # Allow per-project overrides (e.g., direnv override-input project-src "$PWD")
  inputs.project-src.url = "path:.";

  outputs = inputs @ { nixpkgs, flake-parts, project-src, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { system, ... }:
        let
          pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
          projects = import ./projects { inherit pkgs; };
        in {
          devShells = projects;
        };
    };
}
