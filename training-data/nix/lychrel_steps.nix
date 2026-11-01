# Reverse-and-add until a palindrome; count the steps.
let
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
  rev = n:
    let
      s = toString n;
      len = builtins.stringLength s;
      chars = map (i: builtins.substring (len - 1 - i) 1 s) (range 0 (len - 1));
    in
    builtins.fromJSON (builtins.concatStringsSep "" chars);
  steps = n: count:
    if count > 0 && n == rev n then count
    else if count >= 50 then -1
    else steps (n + rev n) (count + 1);
in
builtins.concatStringsSep " " (map (n: toString (steps n 0)) [ 56 57 59 79 89 ])
