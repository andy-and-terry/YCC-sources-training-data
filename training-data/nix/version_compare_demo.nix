{
  lessThan = builtins.compareVersions "1.2.3" "1.10.0";
  equal = builtins.compareVersions "2.0" "2.0";
  greater = builtins.compareVersions "3.1" "3.0.9";
  parts = builtins.splitVersion "1.22.3-rc1";
  parsed = (builtins.parseDrvName "hello-2.12.1");
}
