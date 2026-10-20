let
  mergeConfigs = cfgs: builtins.foldl' (acc: c: acc // c) { } cfgs;
  mkOption = default: { inherit default; };
  evalModule = { options, config }:
    builtins.mapAttrs (n: o: config.${n} or o.default) options;
  options = { port = mkOption 80; host = mkOption "localhost"; debug = mkOption false; };
in {
  defaults = evalModule { inherit options; config = { }; };
  overridden = evalModule { inherit options; config = { port = 8080; }; };
  merged = mergeConfigs [ { a = 1; } { b = 2; } { a = 3; } ];
  assertion = assert 1 + 1 == 2; "assertion passed";
  cond = if builtins.length (builtins.attrNames options) == 3 then "three" else "other";
  withScope = with { x = 1; y = 2; }; x + y;
}
