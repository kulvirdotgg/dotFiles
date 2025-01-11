{...}: {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        padding = {
          top = 2;
        };
      };

      display = {
        separator = " ➜  ";
      };

      modules = [
        "break"
        "break"
        "break"
        {
          type = "os";
          key = "OS   ";
          keyColor = "red";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "red";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "red";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "green";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "green";
        }
        {
          type = "cursor";
          key = " ├  ";
          keyColor = "green";
        }
        {
          type = "terminal";
          key = " └  ";
          keyColor = "green";
        }
        "break"
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC   ";
          keyColor = "yellow";
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = " ├  ";
          keyColor = "yellow";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "yellow";
        }
        {
          type = "swap";
          key = " ├ 󰓡 ";
          keyColor = "yellow";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "yellow";
        }
        {
          type = "uptime";
          key = " ├  ";
          keyColor = "yellow";
        }
        {
          type = "monitor";
          key = " └  ";
          keyColor = "yellow";
        }
        "break"
        "break"
      ];
    };
  };
}
