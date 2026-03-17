{ pkgs ? import <nixpkgs> { } }:
{
  nostr-dump-cli = pkgs.callPackage ./pkgs/nostr-dump-cli { };
}
