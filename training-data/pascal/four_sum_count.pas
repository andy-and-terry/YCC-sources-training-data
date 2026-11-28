program FourSumCount;
const
  A: array[0..1] of Integer = (1, 2);
  B: array[0..1] of Integer = (-2, -1);
  C: array[0..1] of Integer = (-1, 2);
  D: array[0..1] of Integer = (0, 2);
var
  i, j, k, l, count: Integer;
begin
  { brute force over all tuples keeps the example dependency-free }
  count := 0;
  for i := 0 to 1 do
    for j := 0 to 1 do
      for k := 0 to 1 do
        for l := 0 to 1 do
          if A[i] + B[j] + C[k] + D[l] = 0 then Inc(count);
  WriteLn(count); { 2 }
end.
