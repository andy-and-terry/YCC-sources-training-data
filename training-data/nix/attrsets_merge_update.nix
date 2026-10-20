let
  a = { x = 1; y = { p = 1; q = 2; }; };
  b = { y = { q = 20; r = 30; }; z = 3; };
in {
  shallow = a // b;
  hasX = a ? x;
  hasDeep = a ? y.p;
  getOr = a.nope or "default";
  deep = a.y.q;
  names = builtins.attrNames (a // b);
  vals = builtins.attrValues { m = 1; n = 2; };
  mapped = builtins.mapAttrs (n: v: v * 2) { u = 1; w = 2; };
  filtered = builtins.removeAttrs (a // b) [ "z" ];
  inherited = let q = 5; in { inherit q; inherit (a) x; };
  rec' = rec { one = 1; two = one + 1; three = two + 1; };
  fromList = builtins.listToAttrs [ { name = "k"; value = 1; } { name = "l"; value = 2; } ];
  gen = builtins.genList (i: i * i) 5;
}
