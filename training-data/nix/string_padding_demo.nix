let
  repeatStr = s: n: builtins.concatStringsSep "" (builtins.genList (_: s) n);
  padLeft = width: ch: s:
    let missing = width - builtins.stringLength s;
    in if missing > 0 then (repeatStr ch missing) + s else s;
  padRight = width: ch: s:
    let missing = width - builtins.stringLength s;
    in if missing > 0 then s + (repeatStr ch missing) else s;
in
{
  left = padLeft 6 "0" "42";
  right = padRight 6 "." "ab";
  untouched = padLeft 2 " " "long";
  table = map (n: padLeft 4 " " (toString n)) [ 1 20 300 ];
}
