let
  # `assert cond; expr` aborts evaluation with an error if `cond` is
  # false, otherwise it evaluates to `expr` — a lightweight way to
  # enforce preconditions in a purely functional language with no
  # exceptions to throw.
  safeDivide = a: b:
    assert b != 0;
    a / b;

  mkPositive = n:
    assert builtins.isInt n;
    assert n > 0;
    n;
in
  {
    ok = safeDivide 10 2;
    positive = mkPositive 5;
  }
