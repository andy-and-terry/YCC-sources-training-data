program Hanoi;
var count: integer;
procedure Move(n: integer; a, b, c: char);
begin
  if n = 0 then exit;
  Move(n - 1, a, c, b);
  write(a, '->', c, ' ');
  inc(count);
  Move(n - 1, b, a, c);
end;
begin
  count := 0;
  Move(3, 'A', 'B', 'C');
  writeln;
  writeln(count, ' moves');
end.
