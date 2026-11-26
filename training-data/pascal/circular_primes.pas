{ Circular primes below 100; expect 13. }
program CircularPrimes;

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

function Circular(n: Integer): Boolean;
var s: string; i: Integer; r: string; v, code: Integer;
begin
  Str(n, s);
  Circular := True;
  for i := 0 to Length(s) - 1 do
  begin
    r := Copy(s, i + 1, Length(s)) + Copy(s, 1, i);
    Val(r, v, code);
    if not IsPrime(v) then Circular := False;
  end;
end;

begin
  c := 0;
  for n := 2 to 99 do
    if Circular(n) then Inc(c);
  WriteLn(c);
end.
