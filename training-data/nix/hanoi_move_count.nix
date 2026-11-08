let
  pow2 = n: if n == 0 then 1 else 2 * pow2 (n - 1);
in
{
  three = pow2 3 - 1;
  ten = pow2 10 - 1;
}
