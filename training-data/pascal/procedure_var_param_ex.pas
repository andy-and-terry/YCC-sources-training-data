program ProcedureVarParamEx;
procedure Swap(var A, B: Integer);
var T: Integer;
begin
  T := A; A := B; B := T;
end;
function Fib(N: Integer): Int64;
begin
  if N < 2 then Result := N else Result := Fib(N - 1) + Fib(N - 2);
end;
var X, Y: Integer;
begin
  X := 1; Y := 2;
  Swap(X, Y);
  WriteLn(X, ' ', Y, ' ', Fib(20));
end.
