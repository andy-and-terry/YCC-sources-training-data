program OpenArrayParamsDemo;

function Sum(const a: array of Integer): Integer;
var
  i: Integer;
begin
  Sum := 0;
  for i := Low(a) to High(a) do
    Sum := Sum + a[i];
end;

function MaxOf(const a: array of Integer): Integer;
var
  i: Integer;
begin
  MaxOf := a[Low(a)];
  for i := Low(a) + 1 to High(a) do
    if a[i] > MaxOf then MaxOf := a[i];
end;

procedure Scale(var a: array of Integer; k: Integer);
var
  i: Integer;
begin
  for i := 0 to High(a) do
    a[i] := a[i] * k;
end;

var
  data: array[1..5] of Integer = (4, 8, 15, 16, 23);
  i: Integer;
begin
  WriteLn('sum literal: ', Sum([1, 2, 3]));
  WriteLn('sum data: ', Sum(data));
  WriteLn('max: ', MaxOf(data));
  Scale(data, 2);
  for i := 1 to 5 do Write(data[i], ' ');
  WriteLn;
end.
