program RuthAaronPairs;
{ Consecutive n, n+1 with equal sums of prime factors (with multiplicity). }

function Sopfr(n: Integer): Integer;
var
  p: Integer;
begin
  Sopfr := 0;
  p := 2;
  while p * p <= n do
  begin
    while n mod p = 0 do
    begin
      Sopfr := Sopfr + p;
      n := n div p;
    end;
    Inc(p);
  end;
  if n > 1 then Sopfr := Sopfr + n;
end;

var
  n: Integer;
begin
  for n := 2 to 109 do
    if Sopfr(n) = Sopfr(n + 1) then Write(n, ' ');
  WriteLn;
end.
