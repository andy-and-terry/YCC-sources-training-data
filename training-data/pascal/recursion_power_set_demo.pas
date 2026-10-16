program RecursionPowerSetDemo;

const
  Items: array[0..2] of Char = ('a', 'b', 'c');

procedure Subsets(index: Integer; current: string);
begin
  if index > High(Items) then
  begin
    if current = '' then WriteLn('{}') else WriteLn('{', current, '}');
    Exit;
  end;
  Subsets(index + 1, current);
  Subsets(index + 1, current + Items[index]);
end;

begin
  Subsets(0, '');
end.
