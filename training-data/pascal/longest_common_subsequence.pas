program LongestCommonSubsequence;

function LCS(a, b: string): string;
var
  m, n, i, j: Integer;
  dp: array[0..50, 0..50] of Integer;
  resultStr: string;
begin
  m := Length(a);
  n := Length(b);
  for i := 0 to m do
    for j := 0 to n do
      if (i = 0) or (j = 0) then
        dp[i][j] := 0
      else if a[i] = b[j] then
        dp[i][j] := dp[i - 1][j - 1] + 1
      else if dp[i - 1][j] > dp[i][j - 1] then
        dp[i][j] := dp[i - 1][j]
      else
        dp[i][j] := dp[i][j - 1];

  resultStr := '';
  i := m;
  j := n;
  while (i > 0) and (j > 0) do
  begin
    if a[i] = b[j] then
    begin
      resultStr := a[i] + resultStr;
      i := i - 1;
      j := j - 1;
    end
    else if dp[i - 1][j] >= dp[i][j - 1] then
      i := i - 1
    else
      j := j - 1;
  end;
  LCS := resultStr;
end;

var
  res: string;
begin
  res := LCS('ABCBDAB', 'BDCABA');
  WriteLn(res, ' (length ', Length(res), ')');
end.
