program SetMembershipX2;
type TDigit = set of 0..9;
var s: TDigit; i: integer;
begin
  s := [1, 3, 5, 7, 9];
  for i := 0 to 9 do
    if i in s then write(i, ' ');
  writeln;
end.
