program TwoDimensionalArrayDemo;

const
  N = 4;

var
  grid: array[1..N, 1..N] of Integer;
  i, j: Integer;
begin
  for i := 1 to N do
    for j := 1 to N do
      grid[i, j] := i * j;
  for i := 1 to N do
  begin
    for j := 1 to N do
      Write(grid[i, j]:4);
    WriteLn;
  end;
end.
