program AckermannFunction;

function Ackermann(m, n: Integer): Integer;
begin
  if m = 0 then
    Result := n + 1
  else if n = 0 then
    Result := Ackermann(m - 1, 1)
  else
    Result := Ackermann(m - 1, Ackermann(m, n - 1));
end;

var
  m, n: Integer;
begin
  for m := 0 to 3 do
  begin
    for n := 0 to 4 do
      Write(Ackermann(m, n):5);
    WriteLn;
  end;
end.
