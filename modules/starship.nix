{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      continuation_prompt = "▶▶ ";
      format = "$directory$c$bun$golang$nodejs(bold blue)$git_branch$git_status[❯](bold yellow)[❯](bold purple)[❯](bold blue)\n$character";
      # format = ''$directory$all$character'';
      palette = "catppuccin_mocha";
      scan_timeout = 120;

      bun = {
        format = "[🍞 $version ](bold green)";
        version_format = "\${major}.\${minor}";
      };

      c = {
        detect_extensions = ["c" "cpp"];
        format = "[$symbol $version ]($style)";
        symbol = "";
        version_format = "\${major}.\${minor}";
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      cmd_duration = {
        disabled = true;
      };

      directory = {
        home_symbol = "󰊠 ";
        truncation_length = 2;
        truncate_to_repo = true;
        truncation_symbol = "󰊠 ";
        style = "bold blue";
      };

      git_branch = {
        format = "[$symbol$branch ]($style)";
        style = "bold purple";
        symbol = " ";
        always_show_remote = true;
      };

      golang = {
        format = "[$symbol $version ](bold cyan)";
        version_format = "\${major}.\${minor}";
        symbol = " ";
      };

      hostname = {
        ssh_only = true;
        format = "[$ssh_symbol$hostname ]($style)";
        style = "bold green";
        ssh_symbol = "󰇧 ";
        disabled = false;
      };

      nodejs = {
        detect_files = ["!bun.lockb"];
        format = "[$symbol$version ]($style)";
        version_format = "\${major}.\${minor}";
      };

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
