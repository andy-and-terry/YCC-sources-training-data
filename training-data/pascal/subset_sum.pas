program SubsetSumDemo;

var
  nums: array[0..5] of Integer = (3, 34, 4, 12, 5, 2);
  dp: array[0..100] of Boolean;
  i, sum, n, target: Integer;
begin
  n := 6;
  target := 100;
  for sum := 0 to target do dp[sum] := False;
  dp[0] := True;
  for i := 0 to n - 1 do
    for sum := target downto nums[i] do
      if dp[sum - nums[i]] then dp[sum] := True;

  WriteLn(dp[9]);
  WriteLn(dp[10]);
  WriteLn(dp[100]);
end.
