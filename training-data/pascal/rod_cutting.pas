program RodCuttingDemo;

const
  N = 8;

var
  price: array[1..N] of Integer = (1, 5, 8, 9, 10, 17, 17, 20);
  dp: array[0..N] of Integer;
  length, cut, best: Integer;

begin
  dp[0] := 0;
  for length := 1 to N do
  begin
    best := -1;
    for cut := 1 to length do
      if price[cut] + dp[length - cut] > best then
        best := price[cut] + dp[length - cut];
    dp[length] := best;
  end;
  WriteLn('best revenue for rod length ', N, ': ', dp[N]);
end.
