program ChineseRemainderTheoremDemo;

function ModInverse(a, m: Integer): Integer;
var
  x: Integer;
begin
  ModInverse := 0;
  for x := 0 to m - 1 do
    if ((a mod m) * x) mod m = 1 then
    begin
      ModInverse := x;
      Exit;
    end;
end;

function Crt(const remainders, moduli: array of Integer; count: Integer): Integer;
var
  prod, i, x, pp: Integer;
begin
  prod := 1;
  for i := 0 to count - 1 do prod := prod * moduli[i];
  x := 0;
  for i := 0 to count - 1 do
  begin
    pp := prod div moduli[i];
    x := x + remainders[i] * pp * ModInverse(pp, moduli[i]);
  end;
  Crt := ((x mod prod) + prod) mod prod;
end;

var
  remainders: array[0..2] of Integer = (2, 3, 2);
  moduli: array[0..2] of Integer = (3, 5, 7);
begin
  { x = 2 mod 3, x = 3 mod 5, x = 2 mod 7 -> x = 23 }
  WriteLn(Crt(remainders, moduli, 3));
end.
