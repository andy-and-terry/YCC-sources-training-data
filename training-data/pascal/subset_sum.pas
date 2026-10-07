program SubsetSumDemo;

var
  nums: array[0..5] of Integer = (3, 34, 4, 12, 5, 2);
  dp: array[0..9] of Boolean;
  i, sum, target: Integer;

begin
  target := 9;
  dp[0] := True;
  for sum := 1 to target do
    dp[sum] := False;

  for i := 0 to 5 do
    for sum := target downto nums[i] do
      if dp[sum - nums[i]] then
        dp[sum] := True;

  if dp[target] then
    WriteLn('subset summing to ', target, ' exists')
  else
    WriteLn('no subset sums to ', target);
end.
