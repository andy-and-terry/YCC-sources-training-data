program Secant;
function F(x: double): double; begin F := x * x - 2; end;
var a, b, c: double; i: integer;
begin
  a := 1; b := 2;
  for i := 1 to 40 do
  begin
    if F(b) = F(a) then break;
    c := b - F(b) * (b - a) / (F(b) - F(a));
    a := b; b := c;
  end;
  writeln(b:0:8);
end.
