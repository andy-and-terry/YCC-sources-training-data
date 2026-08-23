program TailRecursiveFactorialDemo;

function Factorial(n: Integer): Integer;
var
  result, i: Integer;
begin
  result := 1;
  for i := 1 to n do result := result * i;
  Factorial := result;
end;

begin
  WriteLn(Factorial(10));
end.
