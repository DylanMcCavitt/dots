{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../modules/home/niri.nix
    ../modules/home/dms.nix
    ../modules/home/foot.nix
    ../modules/home/yazi.nix
    ../modules/home/spicetify.nix
    ../modules/home/gtk.nix
    ../modules/home/kitty.nix
    ../modules/home/zed.nix
    ../modules/home/opencode.nix
    ../modules/home/secrets.nix
  ];

  home.username = "dylan";
  home.homeDirectory = "/home/dylan";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    foot
    fastfetch
    lazygit
    fuzzel
    ripgrep
    bat
    btop
    swaybg
    xwayland-satellite
    yazi
    wev
    kitty
    zed-editor
    obsidian
    freecad-wayland
    nodejs_22
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/dots#cassius";
    };
  };

  programs.direnv.enable = true;

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
    settings = {
      user.name = "Dylan McCavitt";
      core.excludesfile = "~/.config/git/ignore";
    };

    includes = [
      {path = "~/.gitconfig.local";}
    ];
  };

  home.file.".config/git/ignore".text = ''
    .envrc
    .direnv
  '';

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
