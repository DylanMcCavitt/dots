{pkgs, ...}: {
  home.packages = with pkgs; [
    adw-gtk3
    nordic
    papirus-icon-theme
    bibata-cursor-theme
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = pkgs.nordzy-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursor-theme;
      size = 24;
    };
  };
}
