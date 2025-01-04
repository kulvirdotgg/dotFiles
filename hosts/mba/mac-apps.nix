{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = [
    pkgs.fastfetch
  ];

  environment.variables = {
    MANPAGER = "nvim +Man!";
  };

  # Enable alternative shell support in nix-darwin.
  # environment.shells = [
  #     pkgs.fish
  # ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    # Alternate Fonts
    # pkgs.nerd-fonts.caskaydia-mono
    # pkgs.nerd-fonts.iosevka
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    brews = [];
    casks = [
      "discord"
      "obsidian"
      "raycast"
      "spotify"
      "telegram-desktop"

      # CORPO
      "mongodb-compass"
      "postman"
      "slack"
      "zoom"
    ];
  };
}
