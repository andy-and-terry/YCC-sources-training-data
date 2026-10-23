let
  # builtins.parseDrvName splits "name-version" at the first dash that
  # is followed by a digit.
  a = builtins.parseDrvName "hello-2.12.1";
  b = builtins.parseDrvName "python3-minimal-3.11.4";
  c = builtins.parseDrvName "no-version-here";
in
  {
    inherit a b c;
    # the version part can feed builtins.splitVersion
    components = builtins.splitVersion a.version;
    major = builtins.head (builtins.splitVersion a.version);
  }
