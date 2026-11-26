# Emirps below 200; expect 15.
# Evaluate with: nix-instantiate --eval <file>
let
  mod = a: b: a - (a / b) * b;
  range = lo: hi: if lo > hi then [] else builtins.genList (i: lo + i) (hi - lo + 1);
  isPrime = n:
    n > 1 && builtins.all (d: mod n d != 0) (builtins.filter (d: d * d <= n) (range 2 (n / 2 + 1)));
  count = pred: xs: builtins.length (builtins.filter pred xs);
  rev = n:
    let go = m: r: if m == 0 then r else go (m / 10) (r * 10 + mod m 10);
    in go n 0;
in
count (n: rev n != n && isPrime n && isPrime (rev n)) (range 2 199)
