program DigitSum;
var n, s: integer;
begin
  n := 12345; s := 0;
  repeat s := s + n mod 10; n := n div 10; until n = 0;
  writeln(s);
end.
