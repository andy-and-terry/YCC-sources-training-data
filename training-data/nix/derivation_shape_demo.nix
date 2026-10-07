let
  # A stand-in for `stdenv.mkDerivation { ... }`: a real build needs an
  # actual Nix store and builder, so this models the *shape* of a
  # derivation request/result as a plain function over attribute sets
  # instead of calling the `derivation` builtin.
  mkDerivation = args:
    args // {
      type = "derivation";
      outPath = "/nix/store/<hash>-${args.pname}-${args.version}";
      drvAttrs = builtins.removeAttrs args [ "buildPhase" "installPhase" ];
    };

  hello = mkDerivation {
    pname = "hello";
    version = "2.12";
    src = "./hello-2.12.tar.gz";
    buildInputs = [ "gcc" "gnumake" ];
    buildPhase = "make";
    installPhase = "make install PREFIX=$out";
  };
in
{
  name = "${hello.pname}-${hello.version}";
  outPath = hello.outPath;
  inputCount = builtins.length hello.buildInputs;
}
