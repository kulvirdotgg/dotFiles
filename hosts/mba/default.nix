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
    extraSpecialArgs = {inherit username email outputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = import ./home.nix;
  };
}
