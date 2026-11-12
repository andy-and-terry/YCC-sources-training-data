program SetDemo;
type Digit = set of 0..9;
var s: Digit; i: integer;
begin
  s := [1, 3, 5] + [7];
  for i := 0 to 9 do if i in s then write(i, ' ');
  writeln;
end.
