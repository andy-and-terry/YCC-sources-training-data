let
  pkgs = import <nixpkgs> { };
  version = "1.0";
in
pkgs.stdenv.mkDerivation {
  pname = "hello-demo";
  inherit version;
  src = ./.;
  installPhase = "mkdir -p $out/bin; echo hi > $out/bin/hello";
}
