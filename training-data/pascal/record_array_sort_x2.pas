program RecordArraySortX2;
type
  TP = record name: string; age: integer; end;
var
  a: array[1..3] of TP;
  i, j: integer;
  t: TP;
begin
  a[1].name := 'a'; a[1].age := 30;
  a[2].name := 'b'; a[2].age := 20;
  a[3].name := 'c'; a[3].age := 25;
  for i := 1 to 2 do
    for j := 1 to 3 - i do
      if a[j].age > a[j+1].age then begin t := a[j]; a[j] := a[j+1]; a[j+1] := t; end;
  for i := 1 to 3 do writeln(a[i].name, ' ', a[i].age);
end.
