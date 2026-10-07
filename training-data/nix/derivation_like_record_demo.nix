let
  mkPkg = { pname, version, deps ? [ ], buildInputs ? deps }:
    {
      name = "${pname}-${version}";
      inherit pname version buildInputs;
      closure = builtins.concatLists (map (d: d.closure) buildInputs) ++ [ "${pname}-${version}" ];
    };

  zlib = mkPkg { pname = "zlib"; version = "1.3"; };
  openssl = mkPkg { pname = "openssl"; version = "3.0"; deps = [ zlib ]; };
  curl = mkPkg { pname = "curl"; version = "8.1"; deps = [ openssl zlib ]; };

  unique = l: builtins.foldl' (acc: x: if builtins.elem x acc then acc else acc ++ [ x ]) [ ] l;
in
{
  name = curl.name;
  closure = unique curl.closure;
}
