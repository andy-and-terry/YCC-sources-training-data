let
  # `builtins.tryEval expr` catches a `throw`/`abort` and returns
  # `{ success = false; value = false; }` instead of aborting the whole
  # evaluation — the closest thing Nix has to exception handling.
  safeDivide = a: b:
    if b == 0 then throw "division by zero" else a / b;

  tryDivide = a: b:
    let
      attempt = builtins.tryEval (safeDivide a b);
    in
      if attempt.success then attempt.value else null;
in
  {
    ok = tryDivide 10 2;
    failed = tryDivide 10 0;
    okSuccess = (builtins.tryEval (safeDivide 10 2)).success;
    failedSuccess = (builtins.tryEval (safeDivide 10 0)).success;
  }
