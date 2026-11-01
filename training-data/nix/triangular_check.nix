# n is triangular iff 8n + 1 is a perfect square.
let
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
  isqrt = n: let go = r: if (r + 1) * (r + 1) > n then r else go (r + 1); in go 0;
  isTriangular = n: let s = 8 * n + 1; r = isqrt s; in r * r == s;
in
builtins.concatStringsSep " " (map toString (builtins.filter isTriangular (range 0 20)))
