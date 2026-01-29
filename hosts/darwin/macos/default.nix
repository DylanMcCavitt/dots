{pkgs,...}: {
  imports = [
    ../../../modules/darwin/jankyborders.nix
          ];
  nix.enable = false;

  # Define the user so home-manager can find the home directory
  users.users.dylanmccavitt = {
    home = "/Users/dylanmccavitt";
  };

  # Required for user-specific settings (homebrew, system.defaults, etc.)
  system.primaryUser = "dylanmccavitt";
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  # homebrew
  homebrew ={
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };

    casks = [
      "raycast"
      "ghostty"
      "spotify"
      "visual-studio-code"
      "zed"
      "android-studio"
      "sf-symbols"
      "font-sf-pro"
      "font-sf-mono"
      "flutter"
      "amethyst"
      "obsidian"
      "arduino-ide"
      "freecad"
          ];

};

# fonts
fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.symbols-only
];

# macos defaults
system.defaults = {
  dock = {
    autohide = true;
    autohide-delay = 0.0;
    autohide-time-modifier = 0.1;
    launchanim = false;
    mru-spaces = false;
    orientation = "bottom";
    show-recents = false;
    static-only = true;
    tilesize = 48;
  };

  finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    FXEnableExtensionChangeWarning = false;
        ShowPathbar = true;
    ShowStatusBar = true;
    _FXShowPosixPathInTitle = true;
  };

  NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleKeyboardUIMode = 3;
    ApplePressAndHoldEnabled = false;
    AppleShowAllExtensions = true;
    InitialKeyRepeat = 15;
    KeyRepeat = 2;
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticDashSubstitutionEnabled = false;
    NSAutomaticPeriodSubstitutionEnabled = false;
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = false;
    NSDocumentSaveNewDocumentsToCloud = false;
    NSNavPanelExpandedStateForSaveMode = true;
    NSNavPanelExpandedStateForSaveMode2 = true;
    _HIHideMenuBar = true;
  };

  trackpad = {
    Clicking = true;
    TrackpadRightClick = true;
    TrackpadThreeFingerDrag = true;
  };

  CustomUserPreferences = {
  "com.apple.desktopservices" = {
    DSDontWriteNetworkStores = true;
    DSDontWriteUSBStores = true;
      };
      "com.apple.WindowManager" = {
        EnableStandardClickToShowDesktop = 0;
        StandardHideDesktopIcons = 0;
        HideDesktop = 0;
        StageManagerHideWidgets = 0;
        StandardHideWidgets = 0;
      };
  };
  };

  # keyboard shorts
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  security.pam.services.sudo_local.touchIdAuth = true;


  programs.zsh.enable = true;

  system.stateVersion = 5;
}
