{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."kitty/nord-kitty.conf".source = ./kitty/nord-kitty.conf;
}
