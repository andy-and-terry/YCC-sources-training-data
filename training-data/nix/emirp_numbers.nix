# Emirps: primes whose digit reversal is a different prime.
let
  isPrime = n:
    let go = d: if d * d > n then true else if n - (n / d) * d == 0 then false else go (d + 1);
    in n >= 2 && go 2;
  reverseNum = n:
    let go = m: r: if m == 0 then r else go (m / 10) (r * 10 + (m - (m / 10) * 10));
    in go n 0;
  isEmirp = n: let r = reverseNum n; in r != n && isPrime n && isPrime r;
in
builtins.concatStringsSep " " (map toString (builtins.filter isEmirp (builtins.genList (i: i + 2) 198)))
