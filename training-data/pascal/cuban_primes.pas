program CubanPrimes;

function IsPrime(n: Int64): Boolean;
var i: Int64;
begin
  IsPrime := n >= 2;
  i := 2;
  while IsPrime and (i * i <= n) do
  begin
    if n mod i = 0 then IsPrime := False;
    Inc(i);
  end;
end;

var
  y, p: Int64;
  found: Integer;
begin
  found := 0;
  y := 1;
  while found < 8 do
  begin
    p := 3 * y * y + 3 * y + 1;
    if IsPrime(p) then
    begin
      Write(p, ' ');
      Inc(found);
    end;
    Inc(y);
  end;
  WriteLn;
end.
