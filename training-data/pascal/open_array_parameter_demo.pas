program OpenArrayParameter;

{$mode objfpc}

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

var
  data: array[1..5] of Integer = (4, 8, 15, 16, 23);
begin
  WriteLn('sum literal: ', Sum([1, 2, 3]));
  WriteLn('sum array: ', Sum(data));
  WriteLn('max: ', MaxOf(data));
  WriteLn('count: ', Length(data));
end.
