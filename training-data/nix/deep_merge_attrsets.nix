let
  # `//` only overrides top-level attributes; deepMerge recurses into
  # any attribute that is itself an attrset on both sides, so nested
  # settings are combined rather than replaced wholesale.
  deepMerge = a: b:
    let
      keys = builtins.attrNames a ++ builtins.attrNames b;
      uniqueKeys = builtins.attrNames (builtins.listToAttrs
        (map (k: { name = k; value = true; }) keys));
      mergeKey = k:
        if builtins.hasAttr k a && builtins.hasAttr k b
           && builtins.isAttrs a.${k} && builtins.isAttrs b.${k}
        then { name = k; value = deepMerge a.${k} b.${k}; }
        else if builtins.hasAttr k b
        then { name = k; value = b.${k}; }
        else { name = k; value = a.${k}; };
    in
      builtins.listToAttrs (map mergeKey uniqueKeys);

  base = {
    server = { host = "localhost"; port = 8080; };
    debug = false;
  };

  overrides = {
    server = { port = 9090; tls = true; };
    debug = true;
  };
in
  deepMerge base overrides
