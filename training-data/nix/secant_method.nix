let
  f = x: x * x - 2.0;
  abs = x: if x < 0 then -x else x;
  step = n: x0: x1:
    let
      f0 = f x0;
      f1 = f x1;
      next = x1 - f1 * (x1 - x0) / (f1 - f0);
    in
      if n == 0 || f1 == f0 || abs (next - x1) < 1.0e-12 then next else step (n - 1) x1 next;
in
  step 50 1.0 2.0
