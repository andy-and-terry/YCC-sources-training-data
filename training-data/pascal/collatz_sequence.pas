program CollatzSequence;

function CollatzSteps(n: LongInt): Integer;
var
  steps: Integer;
begin
  steps := 0;
  while n <> 1 do
  begin
    if n mod 2 = 0 then
      n := n div 2
    else
      n := 3 * n + 1;
    Inc(steps);
  end;
  CollatzSteps := steps;
end;

var
  i, best: LongInt;
begin
  WriteLn('27 takes ', CollatzSteps(27), ' steps');
  best := 1;
  for i := 2 to 1000 do
    if CollatzSteps(i) > CollatzSteps(best) then
      best := i;
  WriteLn('Longest under 1000: ', best, ' (', CollatzSteps(best), ' steps)');
end.
