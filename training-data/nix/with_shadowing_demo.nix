let
  outer = { x = 1; y = 2; };
  inner = { x = 10; z = 30; };
in
  with outer;
  {
    # `x` and `y` come from `outer` via the enclosing `with`.
    fromOuterOnly = x + y;

    # a nested `with` on `inner` shadows `outer.x` but `y` still
    # resolves through the first `with`, since `inner` has no `y`.
    fromNestedWith = with inner; x + y + z;

    # an explicit `let` binding always wins over anything a `with`
    # would otherwise bring into scope.
    letWins = let x = 999; in x + y;
  }
