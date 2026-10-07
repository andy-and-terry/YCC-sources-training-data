program HanoiCountDemo;

function Moves(n: Integer): Int64;
begin
  if n = 0 then
    Moves := 0
  else
    Moves := 2 * Moves(n - 1) + 1;
end;

procedure Solve(n: Integer; src, dst, tmp: Char; var count: Integer);
begin
  if n = 0 then Exit;
  Solve(n - 1, src, tmp, dst, count);
  Inc(count);
  Solve(n - 1, tmp, dst, src, count);
end;

var
  n, count: Integer;
begin
  for n := 1 to 5 do
  begin
    count := 0;
    Solve(n, 'A', 'C', 'B', count);
    WriteLn(n, ' disks: formula ', Moves(n), ', simulated ', count);
  end;
end.
