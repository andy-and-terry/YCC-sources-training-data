let
  nested = [ [ 1 2 ] [ 3 4 ] [ 5 ] ];
  flattened = builtins.concatLists nested;
in
  flattened
