# Integer (1..3999) to Roman numeral using a greedy table.
let
  table = [
    { v = 1000; s = "M"; } { v = 900; s = "CM"; } { v = 500; s = "D"; } { v = 400; s = "CD"; }
    { v = 100; s = "C"; } { v = 90; s = "XC"; } { v = 50; s = "L"; } { v = 40; s = "XL"; }
    { v = 10; s = "X"; } { v = 9; s = "IX"; } { v = 5; s = "V"; } { v = 4; s = "IV"; }
    { v = 1; s = "I"; }
  ];
  toRoman = n:
    (builtins.foldl'
      (acc: e: {
        rest = acc.rest - (acc.rest / e.v) * e.v;
        out = acc.out + builtins.concatStringsSep "" (builtins.genList (_: e.s) (acc.rest / e.v));
      })
      { rest = n; out = ""; }
      table).out;
in
[ (toRoman 1994) (toRoman 58) ]
