{pkgs,...}:

{
  imports = [
    ../../modules/darwin/aerospace.nix
    ../../modules/darwin/sketchybar-config.nix
  ];

  home.username = "dylanmccavitt";
  home.homeDirectory = "/Users/dylanmccavitt";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    fastfetch
    lazygit
    ripgrep
    bat
    eza
    yazi
    sketchybar
    jankyborders
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      drs = "darwin-rebuild switch --flake ~/projects/dots#dylan-macos";
      ls = "eza --icons";
      ll = "eza -la --icons";
      lg = "lazygit";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };

  programs.git = {
    enable = true;
    settings.user.name = "Dylan McCavitt";
    includes = [
      {path = "~/.gitconfig.local";}
    ];
  };
}
