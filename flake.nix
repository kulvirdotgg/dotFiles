{
  description = "lilJ's nix-config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.11";
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

    system = "aarch64-darwin"; # apple
    x86 = "x86_64-linux";
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-darwin"
    ];
    inherit (self) outputs;
  in {
    # own packages and some modifications
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};

    # darwin-rebuild switch --flake .#mba
    darwinConfigurations."mba" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs username email outputs system;};
      modules = [
        ./hosts/mba
      ];
    };

    # darwin-rebuild switch --flake .#vps
    nixosConfigurations."vps" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs username email outputs;};
      modules = [
        ./hosts/vps
      ];
    };

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
