let
  flatten = prefix: set:
    builtins.foldl' (acc: k:
      let v = set.${k}; name = if prefix == "" then k else "${prefix}.${k}";
      in acc // (if builtins.isAttrs v then flatten name v else { ${name} = v; }))
      { } (builtins.attrNames set);
in
flatten "" { a = { b = 1; c = { d = 2; }; }; e = 3; }
