program HeronArea;

function Heron(a, b, c: Double): Double;
var s: Double;
begin
  s := (a + b + c) / 2;
  Result := Sqrt(s * (s - a) * (s - b) * (s - c));
end;

begin
  WriteLn(Heron(3, 4, 5):0:3);
  WriteLn(Heron(6, 7, 8):0:3);
end.
