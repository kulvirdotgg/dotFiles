{outputs, ...}: {
  imports = [
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
      # outputs.overlays.nur
    ];
  };
}
