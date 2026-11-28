program SecantMethod;

function F(x: Double): Double;
begin
  F := x * x - 2;
end;

var
  x0, x1, f0, f1, nxt: Double;
  i: Integer;
begin
  x0 := 1; x1 := 2;
  for i := 1 to 50 do
  begin
    f0 := F(x0); f1 := F(x1);
    if f1 = f0 then Break;
    nxt := x1 - f1 * (x1 - x0) / (f1 - f0);
    x0 := x1; x1 := nxt;
    if Abs(x1 - x0) < 1e-12 then Break;
  end;
  WriteLn(x1:0:10);
end.
