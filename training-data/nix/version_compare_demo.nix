let
  cmp = builtins.compareVersions;
  versions = [ "1.10.0" "1.2.0" "1.2.10" "0.9" "1.2" ];
  sorted = builtins.sort (a: b: cmp a b < 0) versions;
  newest = builtins.foldl' (a: b: if cmp b a > 0 then b else a) (builtins.head versions) versions;
in
{
  inherit sorted newest;
  lt = cmp "1.2" "1.10";        # -1
  eq = cmp "2.0" "2.0";         # 0
  gt = cmp "3.1pre1" "3.0";     # 1
  parsed = builtins.parseDrvName "hello-2.12.1";
  split = builtins.splitVersion "1.2.3";
}
