program RecordArrayDemo;
type
  TPerson = record
    Name: string;
    Age: Integer;
  end;
var
  people: array[1..2] of TPerson;
  i: Integer;
begin
  people[1].Name := 'Ann'; people[1].Age := 31;
  people[2].Name := 'Bob'; people[2].Age := 25;
  for i := 1 to 2 do
    WriteLn(people[i].Name, ' ', people[i].Age);
end.
