program RecordVariantCaseShape;
{$mode objfpc}
type
  TKind = (skCircle, skRect);
  TShape = record
    case Kind: TKind of
      skCircle: (R: Double);
      skRect: (W, H: Double);
  end;
var
  A, B: TShape;

function Area(const S: TShape): Double;
begin
  case S.Kind of
    skCircle: Result := 3.14159 * S.R * S.R;
    skRect: Result := S.W * S.H;
  end;
end;

begin
  A.Kind := skCircle; A.R := 2;
  B.Kind := skRect; B.W := 3; B.H := 4;
  WriteLn(Area(A):0:2);
  WriteLn(Area(B):0:2);
end.
