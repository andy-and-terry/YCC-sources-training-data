let
  zip = xs: ys:
    builtins.genList (i: { fst = builtins.elemAt xs i; snd = builtins.elemAt ys i; })
      (if builtins.length xs < builtins.length ys then builtins.length xs else builtins.length ys);

  zipWith = f: xs: ys:
    builtins.genList (i: f (builtins.elemAt xs i) (builtins.elemAt ys i))
      (if builtins.length xs < builtins.length ys then builtins.length xs else builtins.length ys);

  names = [ "a" "b" "c" ];
  ages = [ 30 25 40 ];
in
  {
    pairs = zip names ages;
    sums = zipWith (a: b: a + b) [ 1 2 3 ] [ 10 20 30 ];
  }
