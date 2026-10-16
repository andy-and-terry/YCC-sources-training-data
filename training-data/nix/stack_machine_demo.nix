let
  run = prog: builtins.foldl' (st:  ins:
    if builtins.isInt ins then [ ins ] ++ st
    else
      let b = builtins.elemAt st 0; a = builtins.elemAt st 1; rest = builtins.tail (builtins.tail st);
      in [ (if ins == "+" then a + b else if ins == "-" then a - b else if ins == "*" then a * b else a / b) ] ++ rest
  ) [ ] prog;
in
builtins.head (run [ 3 4 "+" 5 "*" 2 "-" ])
