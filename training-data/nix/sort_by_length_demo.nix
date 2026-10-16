let
  words = [ "banana" "fig" "apple" "kiwi" "plum" ];
  byLen = builtins.sort (a: b:
    let la = builtins.stringLength a; lb = builtins.stringLength b;
    in if la == lb then a < b else la < lb) words;
in
byLen
