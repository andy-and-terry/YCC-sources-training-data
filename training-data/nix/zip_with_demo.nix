let
  zipWith = f: a: b:
    builtins.genList (i: f (builtins.elemAt a i) (builtins.elemAt b i))
      (if builtins.length a < builtins.length b then builtins.length a else builtins.length b);
in
{
  sums = zipWith (x: y: x + y) [ 1 2 3 ] [ 10 20 30 40 ];
  pairs = zipWith (x: y: { ${x} = y; }) [ "a" "b" ] [ 1 2 ];
}
