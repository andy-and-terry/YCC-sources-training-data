# Rail fence encryption with k rails
let
  k = 3;
  text = "WEAREDISCOVERED";
  cycle = 2 * (k - 1);
  rail = i: let r = i - (i / cycle) * cycle; in if r < k then r else cycle - r;
  chars = builtins.genList (i: builtins.substring i 1 text) (builtins.stringLength text);
  forRail = r: builtins.concatStringsSep "" (builtins.filter (x: x != null)
    (builtins.genList (i: if rail i == r then builtins.elemAt chars i else null) (builtins.length chars)));
in
builtins.concatStringsSep "" (builtins.genList forRail k)
