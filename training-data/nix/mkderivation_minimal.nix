{ stdenv }:
stdenv.mkDerivation {
  pname = "hello-demo";
  version = "1.0";
  src = ./.;
  buildPhase = "echo building";
  installPhase = ''
    mkdir -p $out/bin
    echo '#!/bin/sh' > $out/bin/hello
    echo 'echo hi' >> $out/bin/hello
    chmod +x $out/bin/hello
  '';
}
