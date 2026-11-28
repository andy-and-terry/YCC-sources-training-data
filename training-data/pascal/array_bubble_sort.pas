program Bubble;
var a: array[1..5] of Integer = (5, 2, 9, 1, 7);
    i, j, t: Integer;
begin
  for i := 1 to 4 do
    for j := 1 to 5 - i do
      if a[j] > a[j + 1] then begin t := a[j]; a[j] := a[j + 1]; a[j + 1] := t end;
  for i := 1 to 5 do write(a[i], ' ');
  writeln;
end.
