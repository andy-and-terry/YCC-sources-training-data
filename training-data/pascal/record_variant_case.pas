program VariantRec;
type
  Shape = record
    case kind: Integer of
      0: (radius: Real);
      1: (w, h: Real);
  end;
var s: Shape;
begin
  s.kind := 1; s.w := 2; s.h := 3.5;
  writeln(s.w * s.h:0:2);
end.
