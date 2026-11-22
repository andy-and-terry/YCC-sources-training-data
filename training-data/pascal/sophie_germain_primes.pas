program SophieGermainPrimes;
{ Sophie Germain primes: p prime and 2p + 1 prime. }
var
  p: Integer;

function IsPrime(k: Integer): Boolean;
var
  d: Integer;
begin
  IsPrime := k >= 2;
  d := 2;
  while IsPrime and (d * d <= k) do
  begin
    if k mod d = 0 then IsPrime := False;
    Inc(d);
  end;
end;

begin
  for p := 2 to 99 do
    if IsPrime(p) and IsPrime(2 * p + 1) then Write(p, ' ');
  WriteLn;
end.
