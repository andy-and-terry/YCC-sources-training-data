program RecordsWithStatementDemo;

type
  TPerson = record
    Name: string;
    Age: Integer;
  end;

var
  p: TPerson;
begin
  with p do
  begin
    Name := 'Grace';
    Age := 36;
  end;
  WriteLn(p.Name, ' is ', p.Age);
  p.Age := p.Age + 1;
  WriteLn(p.Age);
end.
