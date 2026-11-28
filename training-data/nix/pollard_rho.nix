let
  gcd = a: b: if b == 0 then a else gcd b (a - (a / b) * b);
  abs = x: if x < 0 then -x else x;
  rho = n:
    let
      f = v: builtins.rem (v * v + 1) n;
      go = x: y:
        let x1 = f x; y1 = f (f y); d = gcd (abs (x1 - y1)) n;
        in if d == 1 then go x1 y1 else d;
    in go 2 2;
  p = rho 8051;
in
{ n = 8051; factor = p; cofactor = 8051 / p; }
