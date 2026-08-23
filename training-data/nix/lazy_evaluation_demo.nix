let
  expensive = builtins.trace "computing expensive value" (2 + 2);
  lazyPair = { used = 1; unused = expensive; };
in
  lazyPair.used
