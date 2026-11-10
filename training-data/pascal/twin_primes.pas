program TwinPrimes;
const Limit = 80;
var
  composite: array[0..Limit] of Boolean;
  i, j, p: Integer;
begin
  FillChar(composite, SizeOf(composite), 0);
  i := 2;
  while i * i <= Limit do
  begin
    if not composite[i] then
    begin
      j := i * i;
      while j <= Limit do
      begin
        composite[j] := True;
        j := j + i;
      end;
    end;
    Inc(i);
  end;
  for p := 3 to Limit - 2 do
    if (not composite[p]) and (not composite[p + 2]) then
      Write('(', p, ',', p + 2, ') ');
  WriteLn; { (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73) }
end.
