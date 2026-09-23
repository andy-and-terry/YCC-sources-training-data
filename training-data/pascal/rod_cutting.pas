program RodCuttingDemo;

var
  prices: array[1..8] of Integer = (1, 5, 8, 9, 10, 17, 17, 20);
  dp: array[0..8] of Integer;
  n, i, best, candidate: Integer;
begin
  dp[0] := 0;
  for n := 1 to 8 do
  begin
    best := 0;
    for i := 1 to n do
    begin
      candidate := prices[i] + dp[n - i];
      if candidate > best then best := candidate;
    end;
    dp[n] := best;
  end;
  WriteLn(dp[8]);
  WriteLn(dp[4]);
end.
