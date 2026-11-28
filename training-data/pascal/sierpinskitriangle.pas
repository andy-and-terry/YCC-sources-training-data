program SierpinskiTriangle;
const N = 8;
var r, c: integer;
begin
  for r := 0 to N - 1 do
  begin
    Write(StringOfChar(' ', N - r - 1));
    for c := 0 to r do
      if (r and c) = c then Write('* ') else Write('  ');
    WriteLn;
  end;
end.
