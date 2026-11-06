{ Emirps: primes whose digit reversal is a different prime. }
program EmirpNumbers;
var
  n, r: Integer;

function IsPrime(x: Integer): Boolean;
var
  i: Integer;
begin
  IsPrime := x >= 2;
  i := 2;
  while i * i <= x do
  begin
    if x mod i = 0 then IsPrime := False;
    Inc(i);
  end;
end;

function Reverse(x: Integer): Integer;
var
  res: Integer;
begin
  res := 0;
  while x > 0 do
  begin
    res := res * 10 + x mod 10;
    x := x div 10;
  end;
  Reverse := res;
end;

begin
  for n := 2 to 99 do
  begin
    r := Reverse(n);
    if (r <> n) and IsPrime(n) and IsPrime(r) then Write(n, ' ');
  end;
  WriteLn;
end.
