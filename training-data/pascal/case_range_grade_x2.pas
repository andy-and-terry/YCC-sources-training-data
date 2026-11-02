program CaseRangeGradeX2;
var score: integer;
begin
  score := 83;
  case score of
    90..100: writeln('A');
    80..89: writeln('B');
    else writeln('C');
  end;
end.
