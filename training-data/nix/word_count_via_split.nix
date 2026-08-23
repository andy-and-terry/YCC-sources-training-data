let
  text = "the quick brown fox jumps over the lazy dog";
  words = builtins.filter (w: builtins.isString w) (builtins.split " " text);
in
  builtins.length words
