{
  description = "nixos + darwin system";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    opencode-flake = {
      url = "github:aodhanhayter/opencode-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    darwin,
    ...
  } @ inputs: let

    nixosInputs = {
      inherit(inputs) nvf niri dgop dankMaterialShell spicetify-nix opencode-flake sops-nix;
      inherit inputs;
    };

    #darwin safe
    darwinInputs = {
      inherit inputs;
    };
    in
    #nixos configs

      {
    nixosConfigurations = let
      myHosts = ["darrow" "cassius"];
      mkSystem = host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/${host}/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = nixosInputs;
              home-manager.users.dylan = import ./home/default.nix;
            }
          ];
        };
    in
      nixpkgs.lib.genAttrs myHosts mkSystem;

      #darwin congigs
      darwinConfigurations= {
        "dylan-macos" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";

            modules = [
              ./hosts/darwin/macos/default.nix
              home-manager.darwinModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.dylanmccavitt = import ./home/darwin/default.nix;
              }
            ];
        };
      };
  };
}
