let
  user = "ann";
  n = 3;
in ''
  hello ${user}
  count: ${toString n}
  path: ${./.}
''
