# Bulls and Cows scoring for equal-length digit strings.
let
  lib = (import <nixpkgs> { }).lib;
  score = secret: guess:
    let
      s = lib.stringToCharacters secret;
      g = lib.stringToCharacters guess;
      pairs = lib.zipLists s g;
      bulls = builtins.length (builtins.filter (p: p.fst == p.snd) pairs);
      rest = builtins.filter (p: p.fst != p.snd) pairs;
      count = c: xs: builtins.length (builtins.filter (x: x == c) xs);
      digits = lib.unique (map (p: p.fst) rest);
      cows = builtins.foldl'
        (acc: c: acc + lib.min (count c (map (p: p.fst) rest)) (count c (map (p: p.snd) rest)))
        0 digits;
    in { inherit bulls cows; };
in
score "1807" "7810"
