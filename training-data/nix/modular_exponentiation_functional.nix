let
  powMod = base: exp: modulus:
    let
      go = base: exp: acc:
        if exp == 0 then acc
        else if builtins.bitAnd exp 1 == 1 then
          go (base * base mod modulus) (exp / 2) (acc * base mod modulus)
        else
          go (base * base mod modulus) (exp / 2) acc;
    in
      go (base mod modulus) exp 1;
in
{
  # 4^13 mod 497 = 445
  example1 = powMod 4 13 497;
  # 2^10 mod 1000 = 24
  example2 = powMod 2 10 1000;
  # 7^0 mod 5 = 1
  example3 = powMod 7 0 5;
}
