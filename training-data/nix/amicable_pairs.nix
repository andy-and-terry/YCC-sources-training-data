# Amicable pairs below 1500 via sums of proper divisors.
# Evaluate with: nix-instantiate --eval --strict amicable_pairs.nix
let
  range = lo: hi: builtins.genList (i: lo + i) (hi - lo + 1);
  mod = a: b: a - (a / b) * b;
  sum = builtins.foldl' (a: b: a + b) 0;
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  digits = n: if n < 10 then [ n ] else digits (n / 10) ++ [ (mod n 10) ];
  gcd = a: b: if b == 0 then a else gcd b (mod a b);
  s = n: sum (builtins.filter (d: mod n d == 0) (range 1 (n - 1)));
in
builtins.concatMap (a:
  let b = s a; in
  if b > a && s b == a then [ [ a b ] ] else [ ]
) (range 2 1499)
