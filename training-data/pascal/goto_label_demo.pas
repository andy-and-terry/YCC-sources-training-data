program GotoLabelDemo;

{$mode objfpc}

label
  Retry, Done;

var
  attempts: Integer;
  i, j: Integer;

begin
  { goto used for a simple retry loop }
  attempts := 0;
Retry:
  Inc(attempts);
  WriteLn('attempt ', attempts);
  if attempts < 3 then
    goto Retry;

  { the classic legitimate use: escaping nested loops }
  for i := 1 to 5 do
    for j := 1 to 5 do
      if i * j = 12 then
      begin
        WriteLn('found ', i, ' * ', j, ' = 12');
        goto Done;
      end;

Done:
  WriteLn('finished after ', attempts, ' attempts');
end.
