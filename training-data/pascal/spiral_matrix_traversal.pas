program SpiralMatrixTraversalDemo;

const
  Rows = 3;
  Cols = 3;

var
  matrix: array[0..Rows - 1, 0..Cols - 1] of Integer =
    ((1, 2, 3), (4, 5, 6), (7, 8, 9));
  top, bottom, left, right, r, c: Integer;

begin
  top := 0; bottom := Rows - 1;
  left := 0; right := Cols - 1;
  while (top <= bottom) and (left <= right) do
  begin
    for c := left to right do Write(matrix[top][c], ' ');
    top := top + 1;
    for r := top to bottom do Write(matrix[r][right], ' ');
    right := right - 1;
    if top <= bottom then
    begin
      for c := right downto left do Write(matrix[bottom][c], ' ');
      bottom := bottom - 1;
    end;
    if left <= right then
    begin
      for r := bottom downto top do Write(matrix[r][left], ' ');
      left := left + 1;
    end;
  end;
  WriteLn;
end.
