{...}: {
  home.file.".config/aerospace/aerospace.toml".source = ./aerospace/aerospace.toml;

  launchd.agents.aerospace = {
    enable = true;
    config = {
      ProgramArguments = [ "/Applications/AeroSpace.app/Contents/MacOS/AeroSpace" ];
      RunAtLoad = true;
      KeepAlive = true;
    };
  };
}
