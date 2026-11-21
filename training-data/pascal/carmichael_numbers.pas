program CarmichaelNumbers;
{ Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n. }
var
  n: Int64;

function Gcd(a, b: Int64): Int64;
begin
  if b = 0 then Gcd := a else Gcd := Gcd(b, a mod b);
end;

function PowMod(b, e, m: Int64): Int64;
var
  r: Int64;
begin
  r := 1;
  b := b mod m;
  while e > 0 do
  begin
    if e and 1 = 1 then r := r * b mod m;
    b := b * b mod m;
    e := e shr 1;
  end;
  PowMod := r;
end;

function IsPrime(n: Int64): Boolean;
var
  p: Int64;
begin
  IsPrime := n > 1;
  p := 2;
  while p * p <= n do
  begin
    if n mod p = 0 then
    begin
      IsPrime := False;
      Exit;
    end;
    Inc(p);
  end;
end;

function IsCarmichael(n: Int64): Boolean;
var
  a: Int64;
begin
  IsCarmichael := False;
  if IsPrime(n) then Exit;
  for a := 2 to n - 1 do
    if (Gcd(a, n) = 1) and (PowMod(a, n - 1, n) <> 1) then Exit;
  IsCarmichael := True;
end;

begin
  n := 3;
  while n < 3000 do
  begin
    if IsCarmichael(n) then Write(n, ' ');
    n := n + 2;
  end;
  WriteLn;
end.
