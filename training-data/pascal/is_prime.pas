program IsPrimeDemo;

function IsPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  IsPrime := True;
  if n < 2 then
  begin
    IsPrime := False;
    Exit;
  end;
  i := 2;
  while i * i <= n do
  begin
    if n mod i = 0 then
    begin
      IsPrime := False;
      Exit;
    end;
    i := i + 1;
  end;
end;

var
  n: Integer;
begin
  for n := 2 to 20 do
    if IsPrime(n) then
      Write(n, ' ');
  WriteLn;
end.
