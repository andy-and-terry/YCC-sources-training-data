program DynamicArraySetLengthDemo;

var
  a: array of Integer;
  i: Integer;
begin
  SetLength(a, 3);
  for i := 0 to High(a) do
    a[i] := (i + 1) * 10;
  SetLength(a, 5);
  a[3] := 40;
  a[4] := 50;
  for i := 0 to Length(a) - 1 do
    Write(a[i], ' ');
  WriteLn;
  SetLength(a, 2);
  WriteLn(Length(a));
end.
