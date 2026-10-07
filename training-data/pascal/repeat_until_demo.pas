program RepeatUntilDemo;

var
  n, steps: Integer;
begin
  { digit reversal using repeat..until }
  n := 12345;
  steps := 0;
  repeat
    Write(n mod 10);
    n := n div 10;
    Inc(steps);
  until n = 0;
  WriteLn;
  WriteLn('digits processed: ', steps);

  { count down with a while loop and Break/Continue }
  n := 10;
  while True do
  begin
    Dec(n);
    if n mod 2 = 0 then Continue;
    if n < 3 then Break;
    Write(n, ' ');
  end;
  WriteLn;
end.
