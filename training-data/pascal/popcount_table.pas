{ Population count (number of set bits) for 0..15 }
program PopcountTable;

function Bits(n: Integer): Integer;
var
  c: Integer;
begin
  c := 0;
  while n > 0 do
  begin
    c := c + (n and 1);
    n := n shr 1;
  end;
  Bits := c;
end;

var
  n: Integer;
begin
  for n := 0 to 15 do
    Write(Bits(n), ' ');
  WriteLn;
end.
