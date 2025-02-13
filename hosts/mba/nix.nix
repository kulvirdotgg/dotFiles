# This file seems like generic nix config options could be moved to common in future
{
  pkgs,
  lib,
  system,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  # Cross-compile GNU/Linux binaries, or even full GNU/Linux system images
  nix.linux-builder.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.hostPlatform = "${system}";

  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 5d";
  };

  # https://github.com/NixOS/nix/issues/7273
  nix.settings = {
    auto-optimise-store = false;
  };
}
