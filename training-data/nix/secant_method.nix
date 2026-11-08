let
  f = x: x * x - 2.0;
  step = { a, b }: { a = b; b = b - (f b) * (b - a) / ((f b) - (f a)); };
  iterate = n: s: if n == 0 then s else iterate (n - 1) (step s);
in
(iterate 8 { a = 1.0; b = 2.0; }).b
