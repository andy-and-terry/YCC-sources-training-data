{ Count contiguous subarrays whose sum equals k (O(n^2) running sums). }
program SubarraySumEqualsK;
const
  Nums: array[1..3] of Integer = (1, 1, 1);

function CountSubarrays(k: Integer): Integer;
var
  i, j, sum, count: Integer;
begin
  count := 0;
  for i := 1 to 3 do
  begin
    sum := 0;
    for j := i to 3 do
    begin
      sum := sum + Nums[j];
      if sum = k then Inc(count);
    end;
  end;
  CountSubarrays := count;
end;

begin
  WriteLn(CountSubarrays(2));
end.
