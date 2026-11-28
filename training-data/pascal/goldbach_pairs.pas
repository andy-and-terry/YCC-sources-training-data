program GoldbachPairs;

function IsPrime(n: Integer): Boolean;
var
  d: Integer;
begin
  Result := n >= 2;
  d := 2;
  while Result and (d * d <= n) do
  begin
    if n mod d = 0 then Result := False;
    Inc(d);
  end;
end;

const
  N = 28;
var
  p: Integer;
begin
  for p := 2 to N div 2 do
    if IsPrime(p) and IsPrime(N - p) then
      WriteLn(p, ' + ', N - p);
end.
