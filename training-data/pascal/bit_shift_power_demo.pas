program BitShiftPowerDemo;

var
  i: Integer;
  x: Cardinal;
begin
  for i := 0 to 8 do
    Write(1 shl i, ' ');
  WriteLn;

  x := 1000;
  while x > 0 do
  begin
    Write(x, ' ');
    x := x shr 1;
  end;
  WriteLn;

  WriteLn('mask low nibble of 0xAB: ', $AB and $0F);
  WriteLn('set bit 4 of 1: ', 1 or (1 shl 4));
  WriteLn('toggle bit 0 of 6: ', 6 xor 1);
  WriteLn('is bit 3 set in 12: ', (12 and (1 shl 3)) <> 0);
end.
