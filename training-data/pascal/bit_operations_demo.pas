program BitOperationsDemo;

function PopCount(n: Cardinal): Integer;
var
  count: Integer;
begin
  count := 0;
  while n <> 0 do
  begin
    count := count + (n and 1);
    n := n shr 1;
  end;
  PopCount := count;
end;

var
  a, b: Cardinal;
begin
  a := 12;
  b := 10;
  WriteLn('and: ', a and b);
  WriteLn('or:  ', a or b);
  WriteLn('xor: ', a xor b);
  WriteLn('shl: ', a shl 2);
  WriteLn('shr: ', a shr 1);
  WriteLn('popcount(255): ', PopCount(255));
  WriteLn('bit 3 of 10 set: ', (b and (1 shl 3)) <> 0);
end.
