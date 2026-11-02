{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [ pkgs.python3 pkgs.git ];
  shellHook = ''echo "dev shell ready"'';
}
