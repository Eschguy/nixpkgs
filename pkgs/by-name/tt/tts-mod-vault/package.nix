{
  lib,
  flutter329,
  makeDesktopItem,
  fetchFromGitHub,
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

  pubspecLock = lib.importJSON ./pubspec.lock.json;

  desktopItem = makeDesktopItem {
    name = "tts-mod-vault";
    exec = "tts-mod-vault";
    icon = "tts_mod_vault_icon";
    comment = "Tabletop Simulator Mod Vault";
    desktopName = "TTS Mod Vault";
    categories = [ "Utility" ];
  };

  meta = {
    description = "Download and backup assets for your Tabletop Simulator mods";
    homepage = "https://github.com/markomijic/TTS-Mod-Vault";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ esch ];
    mainProgram = "tts-mod-vault";
    platforms = lib.platforms.all;
  };
}
