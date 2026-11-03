program PerfectSquareCheck;

function IsPerfectSquare(N: Integer): Boolean;
var
  R: Integer;
begin
  if N < 0 then Exit(False);
  R := Round(Sqrt(N));
  Result := R * R = N;
end;

var
  N: Integer;

begin
  for N := 0 to 29 do
    if IsPerfectSquare(N) then Write(N, ' ');
  WriteLn;
end.
