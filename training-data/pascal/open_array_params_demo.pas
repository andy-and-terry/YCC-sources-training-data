program OpenArrayParamsDemo;

function Sum(const A: array of Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := Low(A) to High(A) do
    Result := Result + A[i];
end;

function MaxOf(const A: array of Integer): Integer;
var
  i: Integer;
begin
  Result := A[0];
  for i := 1 to High(A) do
    if A[i] > Result then Result := A[i];
end;

begin
  WriteLn(Sum([1, 2, 3, 4]));
  WriteLn(MaxOf([7, 2, 9, 4]));
end.
