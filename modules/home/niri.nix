{
  config,
  pkgs,
  inputs,
  ...
}: let
  niriConfig = builtins.concatStringsSep "\n\n" [
    #    (builtins.readFile ./niri/alttab.kdl)
    (builtins.readFile ./niri/binds.kdl)
    (builtins.readFile ./niri/input.kdl)
    (builtins.readFile ./niri/layout.kdl)
    (builtins.readFile ./niri/monitors.kdl)
    (builtins.readFile ./niri/windows.kdl)
    (builtins.readFile ./niri/wpblur.kdl)
  ];
in {
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    package = pkgs.niri;
    config = niriConfig;
  };
}
