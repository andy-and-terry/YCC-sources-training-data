program BitOperationsDemo;

var
  x: Cardinal;
  i, count: Integer;
begin
  x := 181;
  WriteLn(x and 15);
  WriteLn(x or 64);
  WriteLn(x xor 255);
  WriteLn(x shl 2);
  WriteLn(x shr 3);
  count := 0;
  for i := 0 to 31 do
    if (x shr i) and 1 = 1 then Inc(count);
  WriteLn('set bits: ', count);
end.
