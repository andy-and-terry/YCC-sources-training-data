let
  isPrime = n:
    n >= 2 && builtins.all (d: n - (n / d) * d != 0)
      (builtins.filter (d: d * d <= n) (builtins.genList (i: i + 2) (if n > 2 then n - 2 else 0)));
  # Numeric digit reversal (avoids leading-zero parsing problems).
  rev = n: acc: if n == 0 then acc else rev (n / 10) (acc * 10 + (n - (n / 10) * 10));
  isEmirp = n: let r = rev n 0; in r != n && isPrime n && isPrime r;
in
builtins.filter isEmirp (builtins.genList (i: i + 2) 120)
# [ 13 17 31 37 71 73 79 97 107 113 ]
