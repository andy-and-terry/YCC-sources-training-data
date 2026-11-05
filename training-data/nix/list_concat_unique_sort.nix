let
  a = [ 3 1 2 ];
  b = [ 2 5 ];
  all = a ++ b;
in {
  sorted = builtins.sort (x: y: x < y) all;
  len = builtins.length all;
  head = builtins.head all;
}
