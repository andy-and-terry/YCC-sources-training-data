program NestedProcedureScopeDemo;

function SumOfSquares(n: Integer): Integer;
var
  total: Integer;

  procedure AddSquare(k: Integer);
  begin
    total := total + k * k;
  end;

var
  i: Integer;
begin
  total := 0;
  for i := 1 to n do
    AddSquare(i);
  Result := total;
end;

begin
  WriteLn(SumOfSquares(3));
  WriteLn(SumOfSquares(10));
end.
