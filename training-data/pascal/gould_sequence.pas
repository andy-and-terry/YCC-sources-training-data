program GouldSequence;

function Popcount(n: Integer): Integer;
begin
  Popcount := 0;
  while n > 0 do
  begin
    Popcount := Popcount + (n and 1);
    n := n shr 1;
  end;
end;

var n: Integer;
begin
  for n := 0 to 15 do Write(1 shl Popcount(n), ' ');
  WriteLn;
end.
