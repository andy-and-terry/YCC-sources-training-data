program VarParameterSwapDemo;

procedure Swap(var a, b: Integer);
var
  temp: Integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

procedure DivMod(dividend, divisor: Integer; var quotient, remainder: Integer);
begin
  quotient := dividend div divisor;
  remainder := dividend mod divisor;
end;

var
  x, y, q, r: Integer;
begin
  x := 5;
  y := 9;
  Swap(x, y);
  WriteLn(x, ' ', y);
  DivMod(17, 5, q, r);
  WriteLn(q, ' ', r);
end.
