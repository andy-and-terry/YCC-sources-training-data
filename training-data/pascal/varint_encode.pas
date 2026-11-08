program VarInt;
var n: longint;
begin
  n := 300;
  while n >= 128 do
  begin
    write(((n and 127) or 128), ' ');
    n := n shr 7;
  end;
  writeln(n);
end.
