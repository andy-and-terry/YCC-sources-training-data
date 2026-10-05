let
  words = [ "pear" "fig" "banana" "kiwi" "apple" ];
  byLength = builtins.sort (a: b:
    let la = builtins.stringLength a; lb = builtins.stringLength b; in
    if la == lb then a < b else la < lb) words;
  descending = builtins.sort (a: b: a > b) [ 3 1 4 1 5 9 2 6 ];
in
  { inherit byLength descending; }
