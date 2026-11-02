program RecursionHanoiX2;
procedure Hanoi(n: integer; a, b, c: char);
begin
  if n = 0 then exit;
  Hanoi(n - 1, a, c, b);
  writeln(a, ' -> ', c);
  Hanoi(n - 1, b, a, c);
end;
begin
  Hanoi(3, 'A', 'B', 'C');
end.
