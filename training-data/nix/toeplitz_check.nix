let
  isToeplitz = m:
    let
      pairs = builtins.genList (i: { prev = builtins.elemAt m i; cur = builtins.elemAt m (i + 1); }) (builtins.length m - 1);
      ok = { prev, cur }: builtins.tail cur == builtins.genList (j: builtins.elemAt prev j) (builtins.length cur - 1);
    in
    builtins.all ok pairs;
in
{
  yes = isToeplitz [ [ 1 2 3 ] [ 4 1 2 ] [ 5 4 1 ] ];
  no = isToeplitz [ [ 1 2 ] [ 2 2 ] ];
}
