{
  pkgs,
  username,
  email,
  outputs,
  ...
}: {
  imports = [
    # ../../home-modules/alacritty.nix
    ../../home-modules/git.nix
    ../../home-modules/kitty.nix
    ../../home-modules/nvim.nix
    ../../home-modules/shell.nix
    ../../home-modules/starship.nix
    ../../home-modules/tmux.nix
  ];

  home.packages = [
    pkgs.air
    pkgs.awsebcli
    pkgs.bun
    pkgs.go
    pkgs.nodejs_23
    pkgs.python314 # coz awsebcli requires python in $PATH
    pkgs.pnpm

    pkgs.discord # not working without overlays (darwin sucks)
    pkgs.redis
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
