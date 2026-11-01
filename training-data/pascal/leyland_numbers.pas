program LeylandNumbers;
{ Leyland numbers: x^y + y^x for x >= y >= 2. }

function IPow(b, e: Integer): Int64;
var
  i: Integer;
begin
  IPow := 1;
  for i := 1 to e do
    IPow := IPow * b;
end;

var
  x, y: Integer;
begin
  for x := 2 to 4 do
    for y := 2 to x do
      Write(IPow(x, y) + IPow(y, x), ' ');
  WriteLn;
end.
