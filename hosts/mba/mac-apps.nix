{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = [];

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

    caskArgs = {
      appdir = "/Applications";
    };

    # darwin support for packages sucks
    casks = [
      "docker"
      "obsidian"
      "raycast"
      "spotify"
      "zen-browser"

      # not me using em :(
      "mongodb-compass"
      "postman"
      "slack"
      "zoom"
    ];

    global.autoUpdate = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    taps = [];
  };
}
