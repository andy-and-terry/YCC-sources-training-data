program Hanoi;
var moves: integer;
procedure h(n: integer; a, b, c: char);
begin
  if n = 0 then exit;
  h(n - 1, a, c, b); inc(moves); h(n - 1, c, b, a);
end;
begin moves := 0; h(5, 'A', 'B', 'C'); writeln(moves); end.
