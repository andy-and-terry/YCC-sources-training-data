program OpenArrayParamDemo;

function Sum(const xs: array of Integer): Integer;
var
  i: Integer;
begin
  Sum := 0;
  for i := Low(xs) to High(xs) do
    Sum := Sum + xs[i];
end;

procedure PrintAll(const xs: array of string);
var
  i: Integer;
begin
  for i := 0 to High(xs) do
    Write(xs[i], ' ');
  WriteLn;
end;

var
  data: array[1..4] of Integer = (5, 10, 15, 20);
begin
  WriteLn(Sum([1, 2, 3]));
  WriteLn(Sum(data));
  PrintAll(['alpha', 'beta', 'gamma']);
  WriteLn(Length(data));
end.
