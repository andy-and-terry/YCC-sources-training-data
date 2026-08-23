program EditDistanceDemo;

function EditDistance(a, b: string): Integer;
var
  m, n, i, j, cost: Integer;
  table: array[0..20, 0..20] of Integer;
begin
  m := Length(a);
  n := Length(b);
  for i := 0 to m do table[i][0] := i;
  for j := 0 to n do table[0][j] := j;
  for i := 1 to m do
    for j := 1 to n do
    begin
      if a[i] = b[j] then cost := 0 else cost := 1;
      table[i][j] := table[i-1][j] + 1;
      if table[i][j-1] + 1 < table[i][j] then table[i][j] := table[i][j-1] + 1;
      if table[i-1][j-1] + cost < table[i][j] then table[i][j] := table[i-1][j-1] + cost;
    end;
  EditDistance := table[m][n];
end;

begin
  WriteLn(EditDistance('kitten', 'sitting'));
end.
