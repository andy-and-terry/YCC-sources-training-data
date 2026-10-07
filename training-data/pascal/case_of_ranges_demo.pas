program CaseOfRangesDemo;

function Grade(score: Integer): Char;
begin
  case score of
    90..100: Grade := 'A';
    80..89: Grade := 'B';
    70..79: Grade := 'C';
    0..69: Grade := 'F';
  else
    Grade := '?';
  end;
end;

var
  s: Integer;
begin
  for s in [95, 85, 72, 10, 200] do
    WriteLn(s, ' -> ', Grade(s));
end.
