program PollardRho;

function Gcd(a, b: Int64): Int64;
var t: Int64;
begin
  while b <> 0 do begin t := a mod b; a := b; b := t; end;
  Gcd := a;
end;

function Rho(n: Int64): Int64;
var x, y, d: Int64;
begin
  if n mod 2 = 0 then begin Rho := 2; Exit; end;
  x := 2; y := 2; d := 1;
  while d = 1 do
  begin
    x := (x * x + 1) mod n;
    y := (y * y + 1) mod n;
    y := (y * y + 1) mod n;
    d := Gcd(Abs(x - y), n);
  end;
  Rho := d;
end;

var n, p: Int64;
begin
  n := 8051; p := Rho(n);
  WriteLn(n, ' = ', p, ' * ', n div p);
end.
