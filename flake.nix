{
  description = "lilJ's nix-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }: let
    username = "lilj";
    email = "kulvir@duck.com";

    system = "aarch64-darwin"; # apple target arch
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
      "aarch64-linux"
    ];
    inherit (self) outputs;
  in {
    # Custom packages and modifications
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    overlays = import ./overlays {inherit inputs;};

    # darwin-rebuild switch --flake .#mba
    darwinConfigurations."mba" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs username email outputs system;};
      modules = [
        ./hosts/mba

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.lilj = import ./hosts/mba/home.nix;
          home-manager.extraSpecialArgs = {inherit username email outputs;};
        }
      ];
    };

    # darwin-rebuild switch --flake .#vps
    nixosConfigurations = forAllSystems (system: {
      "vps" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs username email outputs system;};
        modules = [
          ./hosts/mba
        ];
      };
    });

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
