{ Perrin sequence P(n)=P(n-2)+P(n-3) }
program PerrinSequence;

var
  v: array[0..9] of Integer;
  i: Integer;
begin
  v[0] := 3; v[1] := 0; v[2] := 2;
  for i := 3 to 9 do
    v[i] := v[i - 2] + v[i - 3];
  for i := 0 to 9 do
    Write(v[i], ' ');
  WriteLn;
end.
