program CenteredSquareNumbers;
{ Centered square numbers: n^2 + (n+1)^2. }
var
  n: Integer;
begin
  for n := 0 to 9 do Write(n * n + (n + 1) * (n + 1), ' ');
  WriteLn;
end.
