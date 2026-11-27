program DelannoyNumbers;
const N = 7;
var
  d: array[0..N, 0..N] of Int64;
  i, j: Integer;
begin
  for i := 0 to N do
    for j := 0 to N do
      if (i = 0) or (j = 0) then d[i, j] := 1
      else d[i, j] := d[i - 1, j] + d[i, j - 1] + d[i - 1, j - 1];
  for i := 0 to N do Write(d[i, i], ' ');
  WriteLn;
end.
