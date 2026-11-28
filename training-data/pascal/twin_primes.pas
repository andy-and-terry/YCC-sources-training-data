program TwinPrimes;

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

var
  p: Integer;
begin
  for p := 3 to 48 do
    if IsPrime(p) and IsPrime(p + 2) then
      WriteLn('(', p, ', ', p + 2, ')');
end.
