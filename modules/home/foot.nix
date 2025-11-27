{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."foot/foot.ini".source = ./foot/foot.ini;
}
