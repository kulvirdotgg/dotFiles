{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;

    historyLimit = 10000;

    mouse = true;

    prefix = "C-x";

    plugins = [
      pkgs.tmuxPlugins.vim-tmux-navigator
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
      }
    ];

    extraConfig = ''
       set-option -sa terminal-overrides ",xterm*:Tc"

       set -s escape-time 0

       # split panes using | and -
       unbind '"'
       unbind %
       bind - split-window -v -c "#{pane_current_path}"
       bind _ split-window -h -c "#{pane_current_path}"

       bind -r k select-pane -U
       bind -r j select-pane -D
       bind -r h select-pane -L
       bind -r l select-pane -R
      '';
  };
}
