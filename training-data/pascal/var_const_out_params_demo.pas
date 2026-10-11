program VarConstOutParamsDemo;

procedure Divide(a, b: Integer; out quotient, remainder: Integer);
begin
  quotient := a div b;
  remainder := a mod b;
end;

procedure Increment(var x: Integer);
begin
  Inc(x);
end;

function Total(const values: array of Integer): Integer;
var
  v: Integer;
begin
  Result := 0;
  for v in values do
    Result := Result + v;
end;

var
  q, r, n: Integer;
begin
  Divide(47, 5, q, r);
  WriteLn('47 = 5 * ', q, ' + ', r);
  n := 9;
  Increment(n);
  Increment(n);
  WriteLn('n = ', n);
  WriteLn('total = ', Total([5, 10, 15]));
end.
