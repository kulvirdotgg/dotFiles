# This file seems like generic nix config options could be moved to common in future
{
  pkgs,
  lib,
  system,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  # Cross-compile GNU/Linux binaries, or even full GNU/Linux system images
  # from someone's config, could be useful but idk
  # nix.linux-builder.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.hostPlatform = "${system}";

  services.nix-daemon.enable = true;

  nix.gc = {
    user = "root";
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Disable auto-optimise-store because of this issue:
  # https://github.com/NixOS/nix/issues/7273
  # nix.settings = {
  #     auto-optimise-store = false;
  # };
}
