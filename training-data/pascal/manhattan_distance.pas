program ManhattanDistance;

var
  a, b: array[1..2] of Integer;
  i, s: Integer;
begin
  a[1] := 1; a[2] := 2;
  b[1] := 4; b[2] := 6;
  s := 0;
  for i := 1 to 2 do
    s := s + Abs(a[i] - b[i]);
  WriteLn(s);
end.
