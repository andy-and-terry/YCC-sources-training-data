program Hanoi;
procedure move(n: Integer; a, b, c: Char);
begin
  if n = 0 then exit;
  move(n - 1, a, c, b);
  writeln(a, ' -> ', c);
  move(n - 1, b, a, c);
end;
begin move(3, 'A', 'B', 'C') end.
