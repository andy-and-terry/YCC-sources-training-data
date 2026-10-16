program BreakContinueDemo;

var
  i, sum: Integer;
begin
  sum := 0;
  for i := 1 to 100 do
  begin
    if i mod 2 = 0 then
      Continue;
    if i > 15 then
      Break;
    sum := sum + i;
    Write(i, ' ');
  end;
  WriteLn;
  WriteLn('sum of odds up to 15: ', sum);

  i := 0;
  while True do
  begin
    Inc(i);
    if i * i > 50 then Break;
  end;
  WriteLn('first i with i*i > 50: ', i);
end.
