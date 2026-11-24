program HexagonalNumbers;
{ Hexagonal numbers: n(2n-1). }
var
  n: Integer;
begin
  for n := 1 to 10 do Write(n * (2 * n - 1), ' ');
  WriteLn;
end.
