program SetOperationsDemo;

type
  IntSet = set of 1..10;

var
  a, b, unionSet, intersectSet, diffSet: IntSet;
  i: Integer;
begin
  a := [1, 2, 3, 4, 5];
  b := [3, 4, 5, 6, 7];
  unionSet := a + b;
  intersectSet := a * b;
  diffSet := a - b;
  Write('Union: ');
  for i := 1 to 10 do if i in unionSet then Write(i, ' ');
  WriteLn;
  Write('Intersection: ');
  for i := 1 to 10 do if i in intersectSet then Write(i, ' ');
  WriteLn;
  Write('Difference: ');
  for i := 1 to 10 do if i in diffSet then Write(i, ' ');
  WriteLn;
end.
