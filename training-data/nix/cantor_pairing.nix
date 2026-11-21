# Cantor pairing function and its inverse (integer sqrt by search).
let
  pair = x: y: (x + y) * (x + y + 1) / 2 + y;
  isqrt = n:
    let go = r: if (r + 1) * (r + 1) > n then r else go (r + 1);
    in go 0;
  unpair = z:
    let
      w = (isqrt (8 * z + 1) - 1) / 2;
      y = z - w * (w + 1) / 2;
    in
    [ (w - y) y ];
in
{
  pair = pair 3 4;
  unpair = unpair 32;
}
