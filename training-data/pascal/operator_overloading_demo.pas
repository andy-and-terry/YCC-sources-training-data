program OperatorOverloadingDemo;

type
  Vector = record
    x, y: Real;
  end;

operator + (a, b: Vector) c: Vector;
begin
  c.x := a.x + b.x;
  c.y := a.y + b.y;
end;

operator * (a: Vector; scalar: Real) c: Vector;
begin
  c.x := a.x * scalar;
  c.y := a.y * scalar;
end;

var
  v1, v2, v3: Vector;
begin
  v1.x := 1.0; v1.y := 2.0;
  v2.x := 3.0; v2.y := 4.0;
  v3 := v1 + v2;
  WriteLn(v3.x:0:2, ' ', v3.y:0:2);
  v3 := v1 * 2.0;
  WriteLn(v3.x:0:2, ' ', v3.y:0:2);
end.
