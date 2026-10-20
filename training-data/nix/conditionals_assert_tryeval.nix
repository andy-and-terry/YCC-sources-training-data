let
  classify = n:
    if n < 0 then "negative"
    else if n == 0 then "zero"
    else if n < 10 then "small"
    else "large";
  safe = expr: builtins.tryEval expr;
  validate = cfg:
    assert builtins.isAttrs cfg;
    assert cfg ? name;
    cfg.name;
  orDefault = attrs: key: attrs.${key} or "missing";
in {
  classes = map classify [ (-5) 0 5 50 ];
  ok = safe (1 + 1);
  failed = safe (throw "boom");
  assertFail = safe (assert false; 1);
  name = validate { name = "svc"; };
  missing = orDefault { a = 1; } "b";
  present = orDefault { b = "yes"; } "b";
  nullCheck = if null == null then "is null" else "not null";
  seq' = builtins.seq (1 + 1) "forced";
  deepSeq = builtins.deepSeq { a = [ 1 2 ]; } "deeply forced";
  trace = builtins.trace "tracing" 42;
}
