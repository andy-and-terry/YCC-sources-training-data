program EquilibriumIndex;
const
  Nums: array[0..5] of Integer = (1, 7, 3, 6, 5, 6);
var
  i, total, left, found: Integer;
begin
  total := 0;
  for i := 0 to High(Nums) do total := total + Nums[i];
  left := 0;
  found := -1;
  for i := 0 to High(Nums) do
  begin
    if (found < 0) and (left = total - left - Nums[i]) then found := i;
    left := left + Nums[i];
  end;
  WriteLn(found); { 3 }
end.
