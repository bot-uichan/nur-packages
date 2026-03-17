{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "nostr-dump-cli";
  version = "unstable-2026-03-02";

  src = fetchFromGitHub {
    owner = "bot-uichan";
    repo = "nostr-dump-cli";
    rev = "adb2bfa6127d297c2ed6ee1d389acf599f375773";
    hash = "sha256-K/5z8lv3F9Ms5nBpu5unZUx9FbfLtw5ZCzIAD/EeyNo=";
  };

  vendorHash = "sha256-/Et/G1QcXxFckjtMmGDlqYqHHPIdQg+6Bz0bZETA5oA=";

  ldflags = [
    "-s"
    "-w"
  ];

  postInstall = ''
    ln -sf $out/bin/nostr-dump-cli $out/bin/nostr-dump
  '';

  meta = {
    description = "CLI to fetch nostr events for an npub with pagination across relays";
    homepage = "https://github.com/bot-uichan/nostr-dump-cli";
    license = lib.licenses.mit;
    mainProgram = "nostr-dump";
    platforms = lib.platforms.unix;
  };
}
