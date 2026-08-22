program FactorialDemo;

function Factorial(n: Integer): Int64;
begin
  if n <= 1 then
    Factorial := 1
  else
    Factorial := n * Factorial(n - 1);
end;

var
  i: Integer;
begin
  for i := 0 to 10 do
    WriteLn(i, ' ', Factorial(i));
end.
