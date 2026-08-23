program KnapsackDemo;

var
  weights: array[0..3] of Integer = (2, 3, 4, 5);
  values: array[0..3] of Integer = (3, 4, 5, 6);
  dp: array[0..5] of Integer;
  i, cap: Integer;
begin
  for cap := 0 to 5 do dp[cap] := 0;
  for i := 0 to 3 do
    for cap := 5 downto weights[i] do
      if dp[cap - weights[i]] + values[i] > dp[cap] then
        dp[cap] := dp[cap - weights[i]] + values[i];
  WriteLn(dp[5]);
end.
