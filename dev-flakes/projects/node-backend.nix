{ pkgs }:
pkgs.mkShell {
  buildInputs = [ pkgs.nodejs_22 pkgs.pnpm pkgs.git pkgs.mongosh ];
  shellHook = ''
    export NODE_ENV=development
    export PATH="$PWD/node_modules/.bin:$PATH"
    export MONGO_URL="mongodb://127.0.0.1:27017/wrkla-dev"
  '';
}
