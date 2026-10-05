program RecordArraySortDemo;

type
  TPerson = record
    Name: string[20];
    Age: Integer;
  end;

var
  people: array[1..4] of TPerson;
  i, j: Integer;
  tmp: TPerson;

procedure SetPerson(idx: Integer; const n: string; a: Integer);
begin
  people[idx].Name := n;
  people[idx].Age := a;
end;

begin
  SetPerson(1, 'Carol', 41);
  SetPerson(2, 'Alice', 29);
  SetPerson(3, 'Dave', 35);
  SetPerson(4, 'Bob', 22);

  for i := 1 to 3 do
    for j := 1 to 4 - i do
      if people[j].Age > people[j + 1].Age then
      begin
        tmp := people[j];
        people[j] := people[j + 1];
        people[j + 1] := tmp;
      end;

  for i := 1 to 4 do
    WriteLn(people[i].Name, ' (', people[i].Age, ')');
end.
