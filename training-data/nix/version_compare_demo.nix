let
  versions = [ "1.10.0" "1.2.0" "1.9.5" "2.0" "1.2" ];
  sorted = builtins.sort (a: b: builtins.compareVersions a b < 0) versions;
in
{
  inherit sorted;
  newest = builtins.elemAt sorted (builtins.length sorted - 1);
  cmp1 = builtins.compareVersions "1.2" "1.10";
  cmp2 = builtins.compareVersions "2.0" "2.0";
  cmp3 = builtins.compareVersions "3.1" "3.0.9";
  parsed = builtins.parseDrvName "hello-2.12.1";
}
