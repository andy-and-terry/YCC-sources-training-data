program PlusOneDigits;
var
  d: array[0..3] of Integer;
  n, i: Integer;
  done: Boolean;
begin
  d[0] := 9; d[1] := 9; n := 2; done := False;
  i := n - 1;
  while (i >= 0) and not done do
  begin
    if d[i] < 9 then begin Inc(d[i]); done := True; end
    else d[i] := 0;
    Dec(i);
  end;
  if not done then
  begin
    for i := n downto 1 do d[i] := d[i - 1];
    d[0] := 1; Inc(n);
  end;
  for i := 0 to n - 1 do Write(d[i]);
  WriteLn; { 100 }
end.
