program LongestCommonSubsequenceDemo;

var
  a: string = 'ABCBDAB';
  b: string = 'BDCABA';
  dp: array[0..7, 0..6] of Integer;
  i, j: Integer;

begin
  for i := 0 to Length(a) do
    dp[i][0] := 0;
  for j := 0 to Length(b) do
    dp[0][j] := 0;

  for i := 1 to Length(a) do
    for j := 1 to Length(b) do
      if a[i] = b[j] then
        dp[i][j] := dp[i - 1][j - 1] + 1
      else if dp[i - 1][j] >= dp[i][j - 1] then
        dp[i][j] := dp[i - 1][j]
      else
        dp[i][j] := dp[i][j - 1];

  WriteLn('LCS length: ', dp[Length(a)][Length(b)]);
end.
