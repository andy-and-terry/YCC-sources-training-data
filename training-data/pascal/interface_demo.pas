{$mode objfpc}{$H+}
program InterfaceDemo;

type
  IShape = interface
    function Area: Double;
    function Name: string;
  end;

  TCircle = class(TInterfacedObject, IShape)
  private
    FR: Double;
  public
    constructor Create(r: Double);
    function Area: Double;
    function Name: string;
  end;

  TRect = class(TInterfacedObject, IShape)
  private
    FW, FH: Double;
  public
    constructor Create(w, h: Double);
    function Area: Double;
    function Name: string;
  end;

constructor TCircle.Create(r: Double); begin FR := r; end;
function TCircle.Area: Double; begin Result := Pi * FR * FR; end;
function TCircle.Name: string; begin Result := 'circle'; end;

constructor TRect.Create(w, h: Double); begin FW := w; FH := h; end;
function TRect.Area: Double; begin Result := FW * FH; end;
function TRect.Name: string; begin Result := 'rectangle'; end;

var
  shapes: array[0..1] of IShape;
  s: IShape;
begin
  shapes[0] := TCircle.Create(1.5);
  shapes[1] := TRect.Create(2, 3.5);
  for s in shapes do
    WriteLn(s.Name, ': ', s.Area:0:2);
end.
