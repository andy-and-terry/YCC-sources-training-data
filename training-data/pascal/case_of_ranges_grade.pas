program CaseRange;
var s: integer;
begin
  s := 85;
  case s of
    90..100: writeln('A');
    80..89: writeln('B');
    0..79: writeln('C');
  else writeln('?');
  end;
end.
