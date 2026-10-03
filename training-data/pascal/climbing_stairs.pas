program ClimbingStairsDemo;

function ClimbStairs(n: Integer): Integer;
var
  a, b, c, i: Integer;
begin
  if n <= 2 then
  begin
    ClimbStairs := n;
    Exit;
  end;
  a := 1;
  b := 2;
  for i := 3 to n do
  begin
    c := a + b;
    a := b;
    b := c;
  end;
  ClimbStairs := b;
end;

begin
  WriteLn(ClimbStairs(5));
  WriteLn(ClimbStairs(10));
end.
