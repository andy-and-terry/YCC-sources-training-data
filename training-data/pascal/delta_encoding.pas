program DeltaEncoding;
const xs: array[0..4] of integer = (10, 12, 15, 15, 20);
var i, acc: integer; d: array[0..4] of integer;
begin
  d[0] := xs[0];
  for i := 1 to 4 do d[i] := xs[i] - xs[i - 1];
  for i := 0 to 4 do write(d[i], ' ');
  writeln;
  acc := 0;
  for i := 0 to 4 do begin acc := acc + d[i]; write(acc, ' '); end;
  writeln;
end.
