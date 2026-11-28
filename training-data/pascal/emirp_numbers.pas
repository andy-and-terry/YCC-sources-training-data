program EmirpNumbers;

function IsPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  Result := n >= 2;
  i := 2;
  while Result and (i * i <= n) do
  begin
    if n mod i = 0 then Result := False;
    Inc(i);
  end;
end;

function ReverseNumber(n: Integer): Integer;
begin
  Result := 0;
  while n > 0 do
  begin
    Result := Result * 10 + n mod 10;
    n := n div 10;
  end;
end;

var
  p: Integer;
begin
  for p := 2 to 199 do
    if (ReverseNumber(p) <> p) and IsPrime(p) and IsPrime(ReverseNumber(p)) then
      Write(p, ' ');
  WriteLn; { 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199 }
end.
