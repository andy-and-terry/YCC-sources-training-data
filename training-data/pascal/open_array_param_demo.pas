program OpenArrayParamDemo;

function Sum(const a: array of Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Low(a) to High(a) do
    Result := Result + a[i];
end;

function MaxOf(const a: array of Integer): Integer;
var
  i: Integer;
begin
  Result := a[Low(a)];
  for i := Low(a) + 1 to High(a) do
    if a[i] > Result then Result := a[i];
end;

begin
  WriteLn(Sum([1, 2, 3, 4, 5]));
  WriteLn(MaxOf([7, 42, 3]));
end.
