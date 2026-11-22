# Sophie Germain primes: p prime and 2p + 1 prime.
let
  isPrime = n:
    let go = d: if d * d > n then true else if n - (n / d) * d == 0 then false else go (d + 1);
    in n >= 2 && go 2;
in
builtins.concatStringsSep " " (map toString
  (builtins.filter (p: isPrime p && isPrime (2 * p + 1)) (builtins.genList (i: i + 2) 98)))
