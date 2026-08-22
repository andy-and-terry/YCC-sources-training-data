program RecordDemo;

type
  TPoint = record
    X, Y: Real;
  end;

function AddPoints(a, b: TPoint): TPoint;
begin
  AddPoints.X := a.X + b.X;
  AddPoints.Y := a.Y + b.Y;
end;

var
  p1, p2, p3: TPoint;
begin
  p1.X := 1.0; p1.Y := 2.0;
  p2.X := 3.0; p2.Y := 4.0;
  p3 := AddPoints(p1, p2);
  WriteLn(p3.X:0:1, ' ', p3.Y:0:1);
end.
