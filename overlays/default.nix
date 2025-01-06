{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    # ghostty = inputs.ghostty.packages.aarch64-darwin.default;

    discord = prev.discord.override {
      withVencord = true;
    };
  };

  # The stable nixpkgs set (declared in the flake inputs) will be accessible through 'pkgs.stable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  # nur = inputs.nur.overlays.default;
}
