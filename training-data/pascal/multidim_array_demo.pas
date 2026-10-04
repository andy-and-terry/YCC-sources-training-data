program MultidimArrayDemo;

const
  Rows = 3;
  Cols = 4;

var
  grid: array[1..Rows, 1..Cols] of Integer;
  r, c, rowSum, grand: Integer;
begin
  for r := 1 to Rows do
    for c := 1 to Cols do
      grid[r, c] := r * c;

  grand := 0;
  for r := 1 to Rows do
  begin
    rowSum := 0;
    for c := 1 to Cols do
    begin
      Write(grid[r, c]:3);
      rowSum := rowSum + grid[r, c];
    end;
    WriteLn('  | ', rowSum);
    grand := grand + rowSum;
  end;
  WriteLn('total: ', grand);
end.
