let
  lib = { double = x: x * 2; inc = x: x + 1; };
in
with lib; double (inc 4)
