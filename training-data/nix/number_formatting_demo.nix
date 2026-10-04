let
  digits = n:
    if n < 10 then [ n ] else digits (n / 10) ++ [ (n - (n / 10) * 10) ];
  toBase = base: n:
    let
      chars = "0123456789abcdef";
      go = k: if k == 0 then "" else go (k / base) + builtins.substring (k - (k / base) * base) 1 chars;
    in if n == 0 then "0" else go n;
  # insert thousands separators
  withCommas = n:
    let
      s = toString n;
      len = builtins.stringLength s;
      go = i: acc:
        if i <= 0 then acc
        else
          let start = if i - 3 < 0 then 0 else i - 3;
              piece = builtins.substring start (i - start) s;
          in go (i - 3) (if acc == "" then piece else piece + "," + acc);
    in go len "";
in
{
  d = digits 90210;
  hex = toBase 16 255;
  bin = toBase 2 10;
  big = withCommas 1234567;
  float = builtins.floor 3.99;
  ceil = builtins.ceil 3.01;
}
