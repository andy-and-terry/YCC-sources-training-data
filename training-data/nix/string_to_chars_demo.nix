let
  chars = s: builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
  reverse = s: builtins.concatStringsSep "" (builtins.foldl' (acc: c: [ c ] ++ acc) [ ] (chars s));
in
{ chars = chars "nix"; rev = reverse "functional"; }
