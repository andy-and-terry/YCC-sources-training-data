program EmirpNumbers;
{ Emirps: primes whose digit reversal is a different prime. }
var
  n, r: Integer;

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

function Reverse(k: Integer): Integer;
begin
  Reverse := 0;
  while k > 0 do
  begin
    Reverse := Reverse * 10 + k mod 10;
    k := k div 10;
  end;
end;

begin
  for n := 2 to 199 do
  begin
    r := Reverse(n);
    if (r <> n) and IsPrime(n) and IsPrime(r) then Write(n, ' ');
  end;
  WriteLn;
end.
