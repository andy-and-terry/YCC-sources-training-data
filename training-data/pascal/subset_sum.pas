program SubsetSumDemo;

const
  ItemCount = 6;
  MaxTarget = 50;

var
  items: array[0..ItemCount - 1] of Integer = (3, 34, 4, 12, 5, 2);

function SubsetSum(target: Integer): Boolean;
var
  dp: array[0..ItemCount, 0..MaxTarget] of Boolean;
  i, s: Integer;
begin
  for i := 0 to ItemCount do
    dp[i][0] := True;
  for s := 1 to target do
    dp[0][s] := False;

  for i := 1 to ItemCount do
    for s := 1 to target do
    begin
      dp[i][s] := dp[i - 1][s];
      if (items[i - 1] <= s) and dp[i - 1][s - items[i - 1]] then
        dp[i][s] := True;
    end;

  SubsetSum := dp[ItemCount][target];
end;

begin
  WriteLn(SubsetSum(9));
  WriteLn(SubsetSum(15));
  WriteLn(SubsetSum(30));
end.
