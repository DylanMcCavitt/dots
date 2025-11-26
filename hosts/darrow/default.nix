{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ../../modules/nixos/nvidia.nix
  ];

  networking = {
    hostName = "darrow";
    networkmanager.enable = true;
  };

  users.users.dylan = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [tree];

    # hasedPasswordFile = config.sops.secrets.user_password.path;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.getty.autologinUser = "dylan";

  services.openssh = {
    enable = true;
    ports = [22];
  };
}
