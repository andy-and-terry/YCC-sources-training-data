let
  mkPkg = { pname, version, deps ? [ ] }: {
    name = "${pname}-${version}";
    inherit pname version deps;
    buildInputs = map (d: d.name) deps;
  };
  zlib = mkPkg { pname = "zlib"; version = "1.3"; };
  curl = mkPkg { pname = "curl"; version = "8.0"; deps = [ zlib ]; };
  overlay = final: prev: {
    curl = prev.curl // { version = "9.9"; name = "curl-9.9"; };
    extra = mkPkg { pname = "extra"; version = "0.1"; };
  };
  pkgs = { inherit zlib curl; };
  extended = pkgs // (overlay extended pkgs);
in {
  curlInputs = curl.buildInputs;
  overlaid = extended.curl.name;
  hasExtra = extended ? extra;
  names = map (p: p.name) (builtins.attrValues extended);
}
