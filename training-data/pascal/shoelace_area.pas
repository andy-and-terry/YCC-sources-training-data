program Shoelace;
const
  X: array[0..3] of real = (0, 4, 4, 0);
  Y: array[0..3] of real = (0, 0, 3, 3);
var i, j: integer; s: real;
begin
  s := 0;
  for i := 0 to 3 do
  begin
    j := (i + 1) mod 4;
    s := s + X[i] * Y[j] - X[j] * Y[i];
  end;
  writeln(abs(s) / 2:0:2);
end.
