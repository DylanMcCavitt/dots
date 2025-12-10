{ lib, ... }: {
  # Keep a declarative base for reference, but allow Zed to write a local
  # settings.json. The base file remains managed; the actual settings.json is
  # created once and then left for local edits.

  # Declarative base copy for diffing/reference
  xdg.configFile."zed/settings.base.json".source = ./zed/settings.json;

  # Install settings.json only if absent, so local edits persist
  home.activation.zedSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="$HOME/.config/zed/settings.json"
    if [ ! -e "$target" ]; then
      mkdir -p "$(dirname "$target")"
      cp ${./zed/settings.json} "$target"
    fi
  '';
}
