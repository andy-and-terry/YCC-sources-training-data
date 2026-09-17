let
  words = [ "apple" "banana" "avocado" "blueberry" "cherry" "clementine" ];

  grouped = builtins.groupBy (w: builtins.substring 0 1 w) words;
in
  grouped
