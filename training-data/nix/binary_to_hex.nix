let
  hexDigits = "0123456789abcdef";
  toHexDigit = d: builtins.substring d 1 hexDigits;

  toHex = n:
    let
      go = m: if m == 0 then "" else go (m / 16) + toHexDigit (m - 16 * (m / 16));
    in
      if n == 0 then "0" else go n;
in
  map toHex [ 0 15 255 4096 65535 ]
