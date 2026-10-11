let
  filterAttrs = pred: set:
    builtins.listToAttrs (builtins.filter (x: pred x.name x.value)
      (map (n: { name = n; value = set.${n}; }) (builtins.attrNames set)));
  env = { HOME = "/root"; PATH = "/bin"; DEBUG = "1"; EDITOR = "vi"; };
in
{
  upperDebug = filterAttrs (n: _: n == "DEBUG") env;
  shortValues = filterAttrs (_: v: builtins.stringLength v <= 3) env;
}
