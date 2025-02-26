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
    ../../modules/fastfetch.nix
    ../../modules/kitty.nix
    ../../modules/nvim.nix
    ../../modules/shell.nix
    ../../modules/starship.nix
    ../../modules/tmux.nix
  ];

  home.packages = [
    pkgs.air
    pkgs.bun
    pkgs.go
    pkgs.nodejs_23
    pkgs.pnpm

    pkgs.discord # nigga ain't working properly
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
