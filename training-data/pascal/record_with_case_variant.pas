program VariantRec;
type
  Shape = record
    case IsCircle: Boolean of
      True: (Radius: Real);
      False: (W, H: Real);
  end;
var s: Shape;
begin
  s.IsCircle := False; s.W := 2; s.H := 3;
  writeln(s.W * s.H : 0 : 1);
end.
