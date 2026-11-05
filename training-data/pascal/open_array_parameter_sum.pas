program OpenArrayParameterSum;
function Sum(const A: array of Integer): Integer;
var I: Integer;
begin
  Result := 0;
  for I := Low(A) to High(A) do Result := Result + A[I];
end;
begin
  WriteLn(Sum([1, 2, 3, 4]));
  WriteLn(Sum([10]));
end.
