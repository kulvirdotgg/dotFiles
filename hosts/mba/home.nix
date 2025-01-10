{
  pkgs,
  username,
  email,
  outputs,
  ...
}: {
  imports = [
    # ../../modules/alacritty.nix
    ../../modules/git.nix
    ../../modules/kitty.nix
    ../../modules/nvim.nix
    ../../modules/shell.nix
    ../../modules/starship.nix
    ../../modules/tmux.nix
    ../../modules/zed.nix
  ];

  home.packages = [
    pkgs.air
    pkgs.awsebcli
    pkgs.bun
    pkgs.go
    pkgs.nodejs_23
    pkgs.python314 # coz awsebcli requires python in $PATH
    pkgs.pnpm

    pkgs.discord # nigga ain't working properly
    pkgs.redis
    pkgs.zed-editor
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
