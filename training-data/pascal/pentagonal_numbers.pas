program PentagonalNumbers;
{ Pentagonal numbers: n(3n-1)/2. }
var
  n: Integer;
begin
  for n := 1 to 10 do Write(n * (3 * n - 1) div 2, ' ');
  WriteLn;
end.
