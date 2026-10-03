program CatalanNumbersDemo;

const
  MaxN = 8;

var
  catalan: array[0..MaxN] of Int64;
  n, i, j: Integer;

begin
  catalan[0] := 1;
  for n := 1 to MaxN do
  begin
    catalan[n] := 0;
    for i := 0 to n - 1 do
      catalan[n] := catalan[n] + catalan[i] * catalan[n - 1 - i];
  end;
  for j := 0 to MaxN do
    Write(catalan[j], ' ');
  WriteLn;
end.
