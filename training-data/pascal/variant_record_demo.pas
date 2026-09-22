program VariantRecordDemo;

type
  ShapeKind = (skCircle, skRectangle);
  Shape = record
    case kind: ShapeKind of
      skCircle: (radius: Real);
      skRectangle: (width, height: Real);
  end;

function Area(s: Shape): Real;
begin
  case s.kind of
    skCircle: Area := 3.14159 * s.radius * s.radius;
    skRectangle: Area := s.width * s.height;
  end;
end;

var
  c, r: Shape;
begin
  c.kind := skCircle;
  c.radius := 2.0;
  r.kind := skRectangle;
  r.width := 3.0;
  r.height := 4.0;
  WriteLn(Area(c):0:2);
  WriteLn(Area(r):0:2);
end.
