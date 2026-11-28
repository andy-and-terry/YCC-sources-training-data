program ChebyshevDistance;

var
  a, b: array[1..2] of Integer;
  i, m: Integer;
begin
  a[1] := 1; a[2] := 2;
  b[1] := 4; b[2] := 6;
  m := 0;
  for i := 1 to 2 do
    if Abs(a[i] - b[i]) > m then m := Abs(a[i] - b[i]);
  WriteLn(m);
end.
