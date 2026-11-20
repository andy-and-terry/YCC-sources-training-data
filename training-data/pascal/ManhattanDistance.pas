program ManhattanDistance;
{ Manhattan distance of two vectors. }
const A: array[1..2] of Integer = (1, 2); B: array[1..2] of Integer = (4, 6);
var i, s: Integer;
begin
  s := 0;
  for i := 1 to 2 do s := s + Abs(A[i] - B[i]);
  WriteLn(s);
end.
