{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  pname = "hello-demo";
  version = "1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    echo 'echo hi' > $out/bin/hi
    chmod +x $out/bin/hi
  '';
}
