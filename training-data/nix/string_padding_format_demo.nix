let
  repeatStr = s: n: builtins.concatStringsSep "" (builtins.genList (_: s) n);
  padLeft = width: s:
    let len = builtins.stringLength s;
    in if len >= width then s else repeatStr " " (width - len) + s;
  padRight = width: s:
    let len = builtins.stringLength s;
    in if len >= width then s else s + repeatStr " " (width - len);

  rows = [
    { name = "apple"; qty = 3; }
    { name = "kiwi"; qty = 12; }
    { name = "banana"; qty = 150; }
  ];
  line = r: padRight 8 r.name + "|" + padLeft 5 (toString r.qty);
in
builtins.concatStringsSep "\n" (map line rows)
