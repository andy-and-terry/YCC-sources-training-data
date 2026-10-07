program RepeatUntilCollatz;

var
  n, steps: Integer;
begin
  n := 27;
  steps := 0;
  repeat
    if Odd(n) then
      n := 3 * n + 1
    else
      n := n div 2;
    Inc(steps);
  until n = 1;
  WriteLn('steps: ', steps);
end.
