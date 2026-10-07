program InterfaceImplementationDemo;

{$mode objfpc}

type
  IShape = interface
    function Area: Double;
  end;

  TSquare = class(TInterfacedObject, IShape)
    Side: Double;
    function Area: Double;
  end;

  TCircle = class(TInterfacedObject, IShape)
    R: Double;
    function Area: Double;
  end;

function TSquare.Area: Double;
begin
  Result := Side * Side;
end;

function TCircle.Area: Double;
begin
  Result := Pi * R * R;
end;

var
  sq: TSquare;
  ci: TCircle;
  shapes: array[0..1] of IShape;
  i: Integer;
begin
  sq := TSquare.Create; sq.Side := 3;
  ci := TCircle.Create; ci.R := 2;
  shapes[0] := sq;
  shapes[1] := ci;
  for i := 0 to 1 do
    WriteLn(shapes[i].Area:0:2);
end.
