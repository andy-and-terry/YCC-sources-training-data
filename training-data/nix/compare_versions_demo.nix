let
  cmp = builtins.compareVersions;
  newest = vs: builtins.foldl' (a: b: if cmp a b >= 0 then a else b) (builtins.head vs) vs;
in
  {
    lt = cmp "1.2.3" "1.10.0";
    eq = cmp "2.0" "2.0";
    gt = cmp "2.1pre1" "2.0";
    newest = newest [ "1.9" "1.10" "1.2" ];
    parsed = builtins.parseDrvName "hello-2.12.1";
  }
