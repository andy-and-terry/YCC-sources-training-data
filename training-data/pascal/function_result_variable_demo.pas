program FunctionResultVariableDemo;

function Classic(x: Integer): Integer;
begin
  Classic := x * 2;
end;

function Modern(x: Integer): Integer;
begin
  Result := x;
  Result := Result + 1;
  Result := Result * 3;
end;

function Accumulate(n: Integer): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to n do
    Result := Result + i;
end;

begin
  WriteLn(Classic(21));
  WriteLn(Modern(4));
  WriteLn(Accumulate(100));
end.
