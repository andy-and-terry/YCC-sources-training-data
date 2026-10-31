program SemiprimeCheck;

function PrimeFactorCount(n: Integer): Integer;
var
  p, count: Integer;
begin
  count := 0;
  p := 2;
  while p * p <= n do
  begin
    while n mod p = 0 do
    begin
      n := n div p;
      Inc(count);
    end;
    Inc(p);
  end;
  if n > 1 then Inc(count);
  PrimeFactorCount := count;
end;

var
  n: Integer;
begin
  for n := 2 to 29 do
    if PrimeFactorCount(n) = 2 then Write(n, ' ');
  WriteLn;
end.
