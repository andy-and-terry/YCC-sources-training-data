{
  cmp1 = builtins.compareVersions "1.2.3" "1.10.0";
  cmp2 = builtins.compareVersions "2.0" "2.0";
  cmp3 = builtins.compareVersions "3.1" "3.0.9";
  parts = builtins.splitVersion "4.12.7-rc1";
}
