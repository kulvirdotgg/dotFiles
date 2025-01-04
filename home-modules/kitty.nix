{...}: {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14.0;
    };

    keybindings = {
      "kitty_mod+enter" = "no_op";
      "cmd+enter" = "no_op";
      "cmd+t" = "new_tab_with_cwd";

      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+7" = "goto_tab 7";
      "cmd+8" = "goto_tab 8";
      "cmd+9" = "goto_tab 9";
    };

    shellIntegration.enableZshIntegration = true;

    themeFile = "Catppuccin-Mocha";

    extraConfig = ''
      cursor_shape beam

      background_opacity 0.95
      background_blur 12

      macos_quit_when_last_window_closed yes
      macos_show_window_title_in none

      enable_audio_bell no
      hide_window_decorations yes

      # tab bar at bottom stlying
      tab_bar_style powerline
      tab_bar_min_tabs 2
      tab_title_template "{index}"
      active_tab_title_template "{index}"
      tab_bar_background none

      # macOS - CMD/Option navs
      map cmd+backspace send_text all \x15
      map alt+backspace send_text all \x17
      map cmd+left send_text all \x01
      map cmd+right send_text all \x05
    '';
  };
}
