let
  xs = [ 1 2 3 4 5 ];
in
{
  sum = builtins.foldl' (a: b: a + b) 0 xs;
  product = builtins.foldl' (a: b: a * b) 1 xs;
  reversed = builtins.foldl' (acc: x: [ x ] ++ acc) [ ] xs;
}
