let
  values = [
    { v = 1000; s = "M"; }
    { v = 900; s = "CM"; }
    { v = 500; s = "D"; }
    { v = 400; s = "CD"; }
    { v = 100; s = "C"; }
    { v = 90; s = "XC"; }
    { v = 50; s = "L"; }
    { v = 40; s = "XL"; }
    { v = 10; s = "X"; }
    { v = 9; s = "IX"; }
    { v = 5; s = "V"; }
    { v = 4; s = "IV"; }
    { v = 1; s = "I"; }
  ];

  toRoman = n:
    if n == 0 then ""
    else
      let
        entry = builtins.head (builtins.filter (e: e.v <= n) values);
      in
        entry.s + toRoman (n - entry.v);
in
  toRoman 1994
