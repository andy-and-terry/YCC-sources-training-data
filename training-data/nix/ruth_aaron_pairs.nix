# Sum of prime factors counted with multiplicity.
let
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
  mod = a: b: a - (a / b) * b;
  sopfr = n:
    let
      go = n: p: acc:
        if n == 1 then acc
        else if p * p > n then acc + n
        else if mod n p == 0 then go (n / p) p (acc + p)
        else go n (p + 1) acc;
    in go n 2 0;
in
builtins.concatStringsSep " " (map toString (
  builtins.filter (n: sopfr n == sopfr (n + 1)) (range 2 109)
))
