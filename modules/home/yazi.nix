{conifg, ...}: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      log.enabled = false;

      mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
      };

      opener = {
        edit = [
          {
            run = "nvim \"$@\"";
            block = true;
            for = "unix";
          }
        ];
      };
    };

    # ~/.config/yazi.keymap.toml
    keymap = {
      mgr = {
        q = "quit";
        "Ctrl + q" = "quit --no-cwd-file";
        "g" = "cd ~";
      };
    };

    #~/.config/yazi/theme.toml
    theme = {
      mgr = {
        border_style = "Rounded";
      };
    };
  };
}
