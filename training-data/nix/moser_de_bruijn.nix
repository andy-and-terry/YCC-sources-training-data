# Moser-de Bruijn sequence: binary digits of n read in base 4.
let
  mod = a: b: a - (a / b) * b;
  moser = n: if n == 0 then 0 else mod n 2 + 4 * moser (n / 2);
in
builtins.genList moser 12
