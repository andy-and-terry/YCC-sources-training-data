program CoinChangeDemo;

var
  coins: array[0..2] of Integer = (1, 2, 5);
  dp: array[0..11] of Integer;
  n, c: Integer;
begin
  dp[0] := 0;
  for n := 1 to 11 do
  begin
    dp[n] := -1;
    for c := 0 to 2 do
      if (coins[c] <= n) and (dp[n - coins[c]] <> -1) then
        if (dp[n] = -1) or (dp[n - coins[c]] + 1 < dp[n]) then
          dp[n] := dp[n - coins[c]] + 1;
  end;
  WriteLn(dp[11]);
end.
