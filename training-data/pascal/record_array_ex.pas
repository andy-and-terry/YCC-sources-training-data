program RecordArrayEx;
type
  TPerson = record
    Name: string;
    Age: Integer;
  end;
var
  P: array[1..3] of TPerson;
  I: Integer;
begin
  P[1].Name := 'Ann'; P[1].Age := 30;
  P[2].Name := 'Bob'; P[2].Age := 25;
  P[3].Name := 'Cy';  P[3].Age := 41;
  for I := 1 to 3 do
    WriteLn(P[I].Name, ': ', P[I].Age);
end.
