program DeficientNumbers;

function Sigma(n: Integer): Integer;
var
  d: Integer;
begin
  Result := 0;
  for d := 1 to n do
    if n mod d = 0 then Result := Result + d;
end;

var
  n: Integer;
begin
  for n := 1 to 20 do
    if Sigma(n) < 2 * n then Write(n, ' ');
  WriteLn;
end.
