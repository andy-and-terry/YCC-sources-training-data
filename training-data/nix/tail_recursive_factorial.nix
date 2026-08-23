let
  factorial = n:
    let
      go = n: acc: if n <= 1 then acc else go (n - 1) (acc * n);
    in
      go n 1;
in
  factorial 10
