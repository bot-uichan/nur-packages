{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "nostr-dump-cli";
  version = "unstable-2026-03-17";

  src = fetchFromGitHub {
    owner = "bot-uichan";
    repo = "nostr-dump-cli";
    rev = "cf0f23c999beee004545132eb14cd0e430625ef3";
    hash = "sha256-HBTAO0Vt99fetIJ7fEiaDLaYyhJ9h3kpHKLJYAA2bm0=";
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
