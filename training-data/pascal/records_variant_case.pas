{$mode objfpc}{$H+}
program RecordsVariantCase;

type
  TShapeKind = (skCircle, skRect);
  TShape = record
    case Kind: TShapeKind of
      skCircle: (Radius: Double);
      skRect: (W, H: Double);
  end;

function Area(const S: TShape): Double;
begin
  case S.Kind of
    skCircle: Result := 3.14159 * S.Radius * S.Radius;
    skRect: Result := S.W * S.H;
  end;
end;

var
  A, B: TShape;
begin
  A.Kind := skCircle; A.Radius := 2;
  B.Kind := skRect; B.W := 3; B.H := 4;
  WriteLn(Area(A):0:2, ' ', Area(B):0:2);
end.
