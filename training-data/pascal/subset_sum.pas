program SubsetSumDemo;

const
  N = 5;
  Target = 9;

var
  items: array[0..N - 1] of Integer = (3, 34, 4, 12, 5);
  dp: array[0..N, 0..Target] of Boolean;
  i, s: Integer;

begin
  for i := 0 to N do
    dp[i][0] := True;
  for s := 1 to Target do
    dp[0][s] := False;

  for i := 1 to N do
    for s := 1 to Target do
      if items[i - 1] > s then
        dp[i][s] := dp[i - 1][s]
      else
        dp[i][s] := dp[i - 1][s] or dp[i - 1][s - items[i - 1]];

  WriteLn(dp[N][Target]);
end.
