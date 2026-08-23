let
  words = builtins.filter (w: w != "") (builtins.split " " "the quick brown fox the lazy fox");
  wordList = builtins.filter (w: builtins.isString w) words;
  frequency = builtins.foldl'
    (acc: w: acc // { ${w} = (acc.${w} or 0) + 1; })
    { }
    wordList;
in
  frequency
