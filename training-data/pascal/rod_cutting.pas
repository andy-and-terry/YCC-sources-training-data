program RodCuttingDemo;

const
  Length_ = 8;

var
  prices: array[1..Length_] of Integer = (1, 5, 8, 9, 10, 17, 17, 20);
  dp: array[0..Length_] of Integer;
  len, cut, best: Integer;

begin
  dp[0] := 0;
  for len := 1 to Length_ do
  begin
    best := -1;
    for cut := 1 to len do
      if prices[cut] + dp[len - cut] > best then
        best := prices[cut] + dp[len - cut];
    dp[len] := best;
  end;
  WriteLn(dp[Length_]);
end.
