program CombinationSumDemo;

const
  NumCandidates = 4;

var
  candidates: array[0..NumCandidates - 1] of Integer = (2, 3, 6, 7);
  current: array[0..10] of Integer;
  depth: Integer;

procedure Backtrack(start, remaining: Integer);
var
  i, j: Integer;
begin
  if remaining = 0 then
  begin
    for i := 0 to depth - 1 do Write(current[i], ' ');
    WriteLn;
    Exit;
  end;
  if remaining < 0 then Exit;
  for i := start to NumCandidates - 1 do
  begin
    current[depth] := candidates[i];
    depth := depth + 1;
    Backtrack(i, remaining - candidates[i]);
    depth := depth - 1;
  end;
end;

begin
  depth := 0;
  Backtrack(0, 7);
end.
