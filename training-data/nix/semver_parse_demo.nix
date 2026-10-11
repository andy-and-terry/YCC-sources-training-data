let
  parse = v:
    let m = builtins.match "([0-9]+)\\.([0-9]+)\\.([0-9]+)(-([a-z0-9.]+))?" v;
    in if m == null then null else {
      major = builtins.fromJSON (builtins.elemAt m 0);
      minor = builtins.fromJSON (builtins.elemAt m 1);
      patch = builtins.fromJSON (builtins.elemAt m 2);
      pre = builtins.elemAt m 4;
    };
in
{ a = parse "1.22.3"; b = parse "2.0.0-rc.1"; c = parse "oops"; }
