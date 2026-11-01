rec {
  name = "pkg";
  version = "1.2";
  full = "${name}-${version}";
  parts = builtins.splitVersion version;
}
