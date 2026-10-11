program ExitEarlyReturnDemo;

function FirstNegative(const a: array of Integer): Integer;
var
  i: Integer;
begin
  for i := Low(a) to High(a) do
    if a[i] < 0 then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

procedure Describe(n: Integer);
begin
  if n = 0 then
  begin
    WriteLn('zero');
    Exit;
  end;
  if n < 0 then WriteLn('negative') else WriteLn('positive');
end;

begin
  WriteLn(FirstNegative([3, 5, -2, 8]));
  WriteLn(FirstNegative([1, 2, 3]));
  Describe(0);
  Describe(-5);
  Describe(9);
end.
