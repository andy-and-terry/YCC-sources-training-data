# Remove consecutive duplicate characters.
let
  s = "aabbbcdd";
  chars = builtins.genList (i: builtins.substring i 1 s) (builtins.stringLength s);
  step = acc: c:
    if acc != [ ] && builtins.elemAt acc (builtins.length acc - 1) == c then acc else acc ++ [ c ];
in
builtins.concatStringsSep "" (builtins.foldl' step [ ] chars)
