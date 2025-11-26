{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware.graphics = {
    enable = true;
  };

  boot.kernelParams = ["nvidia-drm.modeset=1"];

  services.xserver.videoDrivers = ["nvidia"];
  nixpkgs.config.allowUnfree = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
