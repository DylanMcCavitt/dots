{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;

    theme = "Nord";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      hide_window_decorations = "yes";
      tab_bar_style = "hidden";
      tab_bar_min = 1;
      copy_on_select = "yes";
      confirm_os_window_close = "0";
    };
  };
}
