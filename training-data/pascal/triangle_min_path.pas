program TriangleMinPath;
const
  T: array[0..3, 0..3] of Integer = ((2, 0, 0, 0), (3, 4, 0, 0), (6, 5, 7, 0), (4, 1, 8, 3));
var
  dp: array[0..3] of Integer;
  r, i, m: Integer;
begin
  for i := 0 to 3 do dp[i] := T[3, i];
  for r := 2 downto 0 do
    for i := 0 to r do
    begin
      if dp[i] < dp[i + 1] then m := dp[i] else m := dp[i + 1];
      dp[i] := T[r, i] + m;
    end;
  WriteLn(dp[0]); { 11 }
end.
