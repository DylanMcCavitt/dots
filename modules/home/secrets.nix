{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops.age.keyFile = "/home/dylan/.config/sops/age/keys.txt";

  sops.defaultSopsFile = ../../secrets.yaml;

  sops.secrets.opencode_api_key = {};

  home.sessionVariablesExtra = ''
    export OPENCODE_API_KEY="$(cat ${config.sops.secrets.opencode_api_key.path})"
  '';
}
