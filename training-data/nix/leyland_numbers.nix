# Leyland numbers: x^y + y^x for x >= y >= 2.
let
  pow = b: e: if e == 0 then 1 else b * pow b (e - 1);
  leyland = x: y: pow x y + pow y x;
  range = a: b: if a > b then [ ] else [ a ] ++ range (a + 1) b;
in
builtins.concatStringsSep " " (map toString (
  builtins.concatLists (map (x: map (y: leyland x y) (range 2 x)) (range 2 4))
))
