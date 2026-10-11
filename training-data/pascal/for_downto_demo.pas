program ForDowntoDemo;

var
  i, j: Integer;
begin
  for i := 5 downto 1 do
    Write(i, ' ');
  WriteLn('liftoff');

  for i := 1 to 4 do
  begin
    for j := 1 to i do
      Write('*');
    WriteLn;
  end;

  for i := 10 downto 0 do
    if i mod 5 = 0 then
      WriteLn('multiple of five: ', i);
end.
