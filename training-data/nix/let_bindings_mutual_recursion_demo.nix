let
  # Unlike a plain `{ }` attrset, the bindings inside a `let` block are
  # already mutually recursive by default — no `rec` keyword needed —
  # so two `let`-bound functions can call each other directly.
  isEven = n: if n == 0 then true else isOdd (n - 1);
  isOdd = n: if n == 0 then false else isEven (n - 1);

  # the same holds for plain values, not just functions
  a = 1 + b;
  b = 2;
in
  {
    evenCheck = map isEven [ 0 1 2 3 4 5 ];
    oddCheck = map isOdd [ 0 1 2 3 4 5 ];
    inherit a b;
  }
