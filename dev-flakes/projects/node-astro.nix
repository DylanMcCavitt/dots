{ pkgs }:
pkgs.mkShell {
  buildInputs = [ pkgs.nodejs_22 pkgs.pnpm pkgs.git ];
  shellHook = ''
    export NODE_ENV=development
    export PATH="$PWD/node_modules/.bin:$PATH"
  '';
}
