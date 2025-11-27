{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/home/niri.nix
    ../modules/home/nvf.nix
    ../modules/home/dms.nix
    ../modules/home/foot.nix
    ../modules/home/yazi.nix
    ../modules/home/spicetify.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    foot
    #firefox
    fastfetch
    lazygit
    fuzzel
    ripgrep
    neovim
    bat
    btop
    swaybg
    xwayland-satellite
    yazi
    wev
  ];

  programs.bash = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };

  programs.git = {
    enable = true;
    settings.user.name = "Dylan McCavitt";

    includes = [
      {path = "~/.gitconfig.local";}
    ];
  };

  programs.dankMaterialShell = {
    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enable = true;
    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };
  };
}
