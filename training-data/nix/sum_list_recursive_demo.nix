let
  # a hand-written recursive walk over a list using `head`/`tail`
  # directly, without reaching for `builtins.foldl'`.
  sum = xs:
    if xs == [ ] then 0
    else builtins.head xs + sum (builtins.tail xs);

  count = xs:
    if xs == [ ] then 0
    else 1 + count (builtins.tail xs);

  maximum = xs:
    if builtins.tail xs == [ ] then builtins.head xs
    else
      let
        restMax = maximum (builtins.tail xs);
        first = builtins.head xs;
      in
        if first > restMax then first else restMax;
in
  {
    total = sum [ 4 8 15 16 23 42 ];
    length = count [ 4 8 15 16 23 42 ];
    max = maximum [ 4 8 15 16 23 42 ];
  }
