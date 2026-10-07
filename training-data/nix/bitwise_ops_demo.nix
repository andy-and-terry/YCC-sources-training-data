let
  testBit = n: i: builtins.bitAnd (n / (pow2 i)) 1 == 1;
  pow2 = i: if i == 0 then 1 else 2 * pow2 (i - 1);
  popcount = n: if n == 0 then 0 else (builtins.bitAnd n 1) + popcount (n / 2);
in
  {
    and = builtins.bitAnd 12 10;
    or = builtins.bitOr 12 10;
    xor = builtins.bitXor 12 10;
    bit3Of10 = testBit 10 3;
    bit2Of10 = testBit 10 2;
    popcount255 = popcount 255;
  }
