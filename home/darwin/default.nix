{pkgs,...}:

{
  imports = [
    ../../modules/darwin/ghostty.nix
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
    jankyborders
    nodejs_22
    nodePackages.pnpm
    opencode
    d2
      ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      drs = "sudo darwin-rebuild switch --flake ~/projects/dots#dylan-macos";
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
