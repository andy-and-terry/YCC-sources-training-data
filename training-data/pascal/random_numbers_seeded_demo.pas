program RandomNumbersSeededDemo;

var
  i, rolls: Integer;
  counts: array[1..6] of Integer;
begin
  RandSeed := 12345;
  for i := 1 to 6 do counts[i] := 0;

  for rolls := 1 to 600 do
    Inc(counts[Random(6) + 1]);

  for i := 1 to 6 do
    WriteLn('face ', i, ': ', counts[i] > 0);

  RandSeed := 12345;
  Write('repeatable: ');
  for i := 1 to 5 do Write(Random(100), ' ');
  WriteLn;
  WriteLn('float in [0,1): ', Random < 1.0);
end.
