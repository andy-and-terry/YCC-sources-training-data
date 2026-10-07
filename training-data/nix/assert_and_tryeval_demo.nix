let
  safeDivide = a: b:
    assert b != 0;
    a / b;

  # `builtins.tryEval` catches failures raised by `assert` and `throw`
  # (but not other kinds of errors) and reports success/failure instead
  # of aborting evaluation.
  tryDivide = a: b:
    let outcome = builtins.tryEval (safeDivide a b); in
    if outcome.success then outcome.value else null;
in
{
  ok = tryDivide 10 2;
  failed = tryDivide 10 0;
  thrown = (builtins.tryEval (throw "boom")).success;
}
