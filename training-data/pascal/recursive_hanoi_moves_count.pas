program RecursiveHanoiMovesCount;
var Moves: Integer;

procedure Hanoi(N: Integer; A, B, C: Char);
begin
  if N = 0 then Exit;
  Hanoi(N - 1, A, C, B);
  Inc(Moves);
  Hanoi(N - 1, C, B, A);
end;

begin
  Moves := 0;
  Hanoi(5, 'A', 'B', 'C');
  WriteLn(Moves);
end.
