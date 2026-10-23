program PerrinNumbers;
{ Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3) }
var
  p: array[0..14] of Int64;
  n: Integer;
begin
  p[0] := 3;
  p[1] := 0;
  p[2] := 2;
  for n := 3 to 14 do
    p[n] := p[n - 2] + p[n - 3];
  for n := 0 to 14 do
    Write(p[n], ' ');
  WriteLn;
end.
