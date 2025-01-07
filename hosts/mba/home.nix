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
    pkgs.bun
    pkgs.go
    pkgs.nodejs_23
    pkgs.pnpm

    pkgs.discord
    pkgs.obsidian
    pkgs.spotify
    pkgs.redis
    pkgs.telegram-desktop
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
