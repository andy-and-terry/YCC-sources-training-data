program RepeatUntilDemo;

var
  n, steps: Integer;
  total, i: Integer;
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
  WriteLn('collatz steps: ', steps);

  total := 0;
  i := 0;
  repeat
    Inc(i);
    total := total + i;
  until total > 50;
  WriteLn('first i with sum > 50: ', i, ' (sum ', total, ')');
end.
