{$mode objfpc}{$H+}
program AbstractClassDemo;

uses SysUtils;

type
  TShape = class
    function Area: Double; virtual; abstract;
    function Describe: string;
  end;

  TSquare = class(TShape)
    Side: Double;
    constructor Create(s: Double);
    function Area: Double; override;
  end;

  TRect = class(TShape)
    W, H: Double;
    constructor Create(aw, ah: Double);
    function Area: Double; override;
  end;

function TShape.Describe: string;
begin
  Result := ClassName + ' area ' + FloatToStrF(Area, ffFixed, 8, 2);
end;

constructor TSquare.Create(s: Double); begin Side := s; end;
function TSquare.Area: Double; begin Result := Side * Side; end;
constructor TRect.Create(aw, ah: Double); begin W := aw; H := ah; end;
function TRect.Area: Double; begin Result := W * H; end;

var
  shapes: array[0..1] of TShape;
  i: Integer;
begin
  shapes[0] := TSquare.Create(3);
  shapes[1] := TRect.Create(2, 4.5);
  for i := 0 to 1 do
  begin
    WriteLn(shapes[i].Describe);
    shapes[i].Free;
  end;
end.
