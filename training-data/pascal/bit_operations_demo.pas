program BitOperationsDemo;

{$mode objfpc}

function PopCount(x: Cardinal): Integer;
begin
  Result := 0;
  while x <> 0 do
  begin
    x := x and (x - 1);
    Inc(Result);
  end;
end;

var
  flags: Byte;
begin
  flags := 0;
  flags := flags or (1 shl 0);
  flags := flags or (1 shl 3);
  WriteLn('flags: ', flags);
  WriteLn('bit 3 set: ', (flags and (1 shl 3)) <> 0);
  flags := flags xor (1 shl 3);
  WriteLn('after toggle: ', flags);
  WriteLn('shr: ', 200 shr 2, ' shl: ', 5 shl 3);
  WriteLn('popcount(255) = ', PopCount(255));
  WriteLn('popcount(1024) = ', PopCount(1024));
  WriteLn('not: ', not 0 and $FF);
end.
