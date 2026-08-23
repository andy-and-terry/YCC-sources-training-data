program RecordWithArraysDemo;

type
  Student = record
    name: string;
    grades: array[0..2] of Integer;
  end;

function Average(s: Student): Real;
var
  i, sum: Integer;
begin
  sum := 0;
  for i := 0 to 2 do sum := sum + s.grades[i];
  Average := sum / 3.0;
end;

var
  alice: Student;
begin
  alice.name := 'Alice';
  alice.grades[0] := 90;
  alice.grades[1] := 85;
  alice.grades[2] := 95;
  WriteLn(alice.name, ': ', Average(alice):0:2);
end.
