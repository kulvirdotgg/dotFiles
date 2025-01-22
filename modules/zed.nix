{...}: {
  programs.zed-editor = {
    enable = true;

    extensions = [];

    userSettings = {
      auto_update = false;

      buffer_font_size = 14;
      buffer_font_family = "JetBrainsMono Nerd Font";

      ensure_final_newline_on_save = false;

      hard_tabs = true;

      languages = {
        "TypeScript" = {
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
            "source.organizeImports" = true;
          };
          codeActionOnSave = {
            rules = ["import/order"];
          };
          formatter = "prettier";
        };
      };

      lsp = {
      };

      search = {
        regex = true;
      };

      show_whitespaces = "boundary";

      tab_size = 4;

      tab_bar = {
        show_nav_history_buttons = false;
      };

      tabs = {
        file_icons = true;
        git_status = true;
      };

      telemetery = {
        diagnostics = false;
        metrics = false;
      };

      terminal = {
        font_size = 13;
        line_height = "standard";
        toolbar = {
          breadcrumbs = false;
        };
      };

      theme = {
        mode = "dark";
        light = "Rosé Pine";
        dark = "Rosé Pine";
      };

      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };

      ui_font_size = 14;

      ui_font_family = "JetBrainsMono Nerd Font";

      vim_mode = true;
    };
  };
}
