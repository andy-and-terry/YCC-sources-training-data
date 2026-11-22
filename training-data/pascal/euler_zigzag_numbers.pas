program EulerZigzagNumbers;
{ Euler zigzag numbers via the Seidel-Entringer boustrophedon. }
var
  row, next: array[0..15] of Int64;
  i, j, len: Integer;
begin
  row[0] := 1;
  len := 1;
  Write(1, ' ');
  for i := 1 to 9 do
  begin
    next[0] := 0;
    for j := 1 to len do
      next[j] := next[j - 1] + row[len - j];
    Inc(len);
    for j := 0 to len - 1 do row[j] := next[j];
    Write(row[len - 1], ' ');
  end;
  WriteLn;
end.
