program DelannoyNumbers;
var
  g: array[0..5, 0..5] of LongInt;
  i, j: Integer;
begin
  for i := 0 to 5 do
    for j := 0 to 5 do
      if (i = 0) or (j = 0) then g[i, j] := 1
      else g[i, j] := g[i - 1, j] + g[i, j - 1] + g[i - 1, j - 1];
  for i := 0 to 5 do Write(g[i, i], ' ');
  WriteLn; { 1 3 13 63 321 1683 }
end.
