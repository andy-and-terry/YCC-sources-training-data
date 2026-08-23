program NQueensDemo;

var
  n: Integer;
  count: Integer;

function IsSafe(queens: array of Integer; placed, col: Integer): Boolean;
var
  i, dist: Integer;
begin
  IsSafe := True;
  for i := 0 to placed - 1 do
  begin
    dist := placed - i;
    if (queens[i] = col) or (Abs(queens[i] - col) = dist) then
    begin
      IsSafe := False;
      Exit;
    end;
  end;
end;

procedure Solve(var queens: array of Integer; placed: Integer);
var
  col: Integer;
begin
  if placed = n then
  begin
    count := count + 1;
    Exit;
  end;
  for col := 0 to n - 1 do
    if IsSafe(queens, placed, col) then
    begin
      queens[placed] := col;
      Solve(queens, placed + 1);
    end;
end;

var
  queens: array[0..9] of Integer;
begin
  n := 6;
  count := 0;
  Solve(queens, 0);
  WriteLn(count);
end.
