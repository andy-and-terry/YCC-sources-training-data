program MatrixOperationsDemo;

type
  Matrix2x2 = array[0..1, 0..1] of Integer;

function Multiply(a, b: Matrix2x2): Matrix2x2;
var
  result: Matrix2x2;
  i, j, k: Integer;
begin
  for i := 0 to 1 do
    for j := 0 to 1 do
    begin
      result[i][j] := 0;
      for k := 0 to 1 do
        result[i][j] := result[i][j] + a[i][k] * b[k][j];
    end;
  Multiply := result;
end;

var
  a, b, c: Matrix2x2;
  i, j: Integer;
begin
  a[0][0] := 1; a[0][1] := 2; a[1][0] := 3; a[1][1] := 4;
  b[0][0] := 5; b[0][1] := 6; b[1][0] := 7; b[1][1] := 8;
  c := Multiply(a, b);
  for i := 0 to 1 do
  begin
    for j := 0 to 1 do Write(c[i][j], ' ');
    WriteLn;
  end;
end.
