{
  inputs,
  outputs,
  username,
  email,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager

    ./configuration.nix
    ./mac-apps.nix
    ./nix.nix
    ./users.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };

  home-manager = {
    backupFileExtension = "hnm";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit username email outputs;};
    users.${username} = import ./home.nix;
  };
}
