let
  isqrt = n:
    let
      go = x:
        let y = (x + n / x) / 2;
        in if y >= x then x else go y;
    in if n < 2 then n else go n;
in
map isqrt [ 0 1 15 16 99 100 1000000 ]
