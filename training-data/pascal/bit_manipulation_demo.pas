program BitManipulationDemo;

function PopCount(n: Cardinal): Integer;
begin
  PopCount := 0;
  while n <> 0 do
  begin
    n := n and (n - 1);
    Inc(PopCount);
  end;
end;

function IsBitSet(n: Cardinal; bit: Integer): Boolean;
begin
  IsBitSet := (n shr bit) and 1 = 1;
end;

var
  x: Cardinal;
  i: Integer;
begin
  x := 178;
  WriteLn('popcount(178) = ', PopCount(x));
  for i := 7 downto 0 do
    if IsBitSet(x, i) then Write('1') else Write('0');
  WriteLn;
  WriteLn('set bit 0: ', x or 1);
  WriteLn('clear bit 1: ', x and not Cardinal(2));
  WriteLn('toggle bit 7: ', x xor 128);
  WriteLn('shl 3: ', x shl 3, ' shr 2: ', x shr 2);
  WriteLn('power of two? ', (64 and 63) = 0);
end.
