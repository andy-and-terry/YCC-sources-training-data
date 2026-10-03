program MatrixChainMultiplicationDemo;

const
  N = 5;

var
  dims: array[0..N - 1] of Integer = (40, 20, 30, 10, 30);
  dp: array[0..N - 2, 0..N - 2] of Integer;
  len, i, j, k, cost: Integer;

begin
  for i := 0 to N - 2 do dp[i][i] := 0;
  for len := 2 to N - 1 do
    for i := 0 to N - 1 - len do
    begin
      j := i + len - 1;
      dp[i][j] := MaxInt;
      for k := i to j - 1 do
      begin
        cost := dp[i][k] + dp[k + 1][j] + dims[i] * dims[k + 1] * dims[j + 1];
        if cost < dp[i][j] then dp[i][j] := cost;
      end;
    end;
  WriteLn(dp[0][N - 2]);
end.
