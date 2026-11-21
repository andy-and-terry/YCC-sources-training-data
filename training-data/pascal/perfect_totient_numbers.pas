program PerfectTotientNumbers;
{ Perfect totient numbers: sum of the iterated totient chain down to 1 equals n. }
var
  n, m, total: Integer;

function Gcd(a, b: Integer): Integer;
begin
  if b = 0 then Gcd := a else Gcd := Gcd(b, a mod b);
end;

function Phi(n: Integer): Integer;
var
  k, c: Integer;
begin
  c := 0;
  for k := 1 to n do
    if Gcd(k, n) = 1 then Inc(c);
  Phi := c;
end;

begin
  for n := 2 to 199 do
  begin
    total := 0;
    m := n;
    while m > 1 do
    begin
      m := Phi(m);
      total := total + m;
    end;
    if total = n then Write(n, ' ');
  end;
  WriteLn;
end.
