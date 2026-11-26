{ Twin primes below 100; expect 8. }
program TwinPrimes;

var c, p, n: Integer;

function IsPrime(n: Integer): Boolean;
var d: Integer;
begin
  IsPrime := n >= 2;
  d := 2;
  while IsPrime and (d * d <= n) do
  begin
    if n mod d = 0 then IsPrime := False;
    Inc(d);
  end;
end;

begin
  c := 0;
  for p := 2 to 99 do
    if IsPrime(p) and IsPrime(p + 2) then Inc(c);
  WriteLn(c);
end.
