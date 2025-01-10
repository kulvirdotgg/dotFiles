{pkgs, ...}: {
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        ls = "lsd";
        neofetch = "fastfetch";
        nv = "nvim";
        python = "python3";
      };
      syntaxHighlighting.enable = true;
    };

    btop = {
      enable = true;
      settings = {
        theme_background = false;
        presets = "cpu:0:default mem:0:default net:0:default";
        proc_sorting = "memory";
        update_ms = 1000;
        vim_keys = true;
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    lazygit.enable = true;

    ripgrep.enable = true;

    zoxide = {
      enable = true;
      options = ["--cmd cd"];
    };
  };

  # environment.sessionVariables = {};

  home.packages = [
    pkgs.lsd
  ];
}
