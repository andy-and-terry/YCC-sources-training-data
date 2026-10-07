program TowerOfHanoiDemo;

procedure Hanoi(n: Integer; source, target, aux: Char);
begin
  if n = 0 then Exit;
  Hanoi(n - 1, source, aux, target);
  WriteLn('Move disk ', n, ' from ', source, ' to ', target);
  Hanoi(n - 1, aux, target, source);
end;

begin
  Hanoi(3, 'A', 'C', 'B');
end.
