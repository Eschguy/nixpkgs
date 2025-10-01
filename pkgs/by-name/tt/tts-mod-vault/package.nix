{
  lib,
  flutter329,
  makeDesktopItem,
  fetchFromGitHub,
  fetchurl,
}:

flutter329.buildFlutterApplication rec {
  pname = "tts-mod-vault";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "markomijic";
    repo = "TTS-Mod-Vault";
    tag = "v${version}";
    hash = "sha256-BTs+4QeyVJeg415uiNXww8twQwUInHfB8voWJjeVs20=";
  };

  icon = fetchurl {
    url = "https://github.com/markomijic/TTS-Mod-Vault/raw/9a8eec2b009ee4b653863fa3d553a309a2d07431/assets/icon/tts_mod_vault_icon.png";
    hash = "sha256-xFQpVciuBdOxHCdK4IrskPd0gPeb3x5wklYLlR9vvnY=";
  };

  pubspecLock = lib.importJSON ./pubspec.lock.json;

  desktopItem = makeDesktopItem {
    name = "tts-mod-vault";
    exec = "tts-mod-vault";
    icon = icon;
    comment = "Tabletop Simulator Mod Vault";
    desktopName = "TTS Mod Vault";
    categories = [ "Utility" ];
  };

  postInstall = ''
    install -m 444 -D ${desktopItem}/share/applications/tts-mod-vault.desktop $out/share/applications/tts-mod-vault.desktop
    install -m 444 -D ${icon} $out/share/icons/hicolor/512x512/apps/tts-mod-vault.png
  '';

  meta = {
    description = "Download and backup assets for your Tabletop Simulator mods";
    homepage = "https://github.com/markomijic/TTS-Mod-Vault";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ esch ];
    mainProgram = "tts-mod-vault";
    platforms = lib.platforms.all;
  };
}
