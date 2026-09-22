{$mode objfpc}
program FactoryPatternDemo;

type
  TShape = class
  public
    function Area: Double; virtual; abstract;
  end;

  TCircle = class(TShape)
  private
    FRadius: Double;
  public
    constructor Create(radius: Double);
    function Area: Double; override;
  end;

  TRectangle = class(TShape)
  private
    FWidth, FHeight: Double;
  public
    constructor Create(width, height: Double);
    function Area: Double; override;
  end;

constructor TCircle.Create(radius: Double);
begin
  FRadius := radius;
end;

function TCircle.Area: Double;
begin
  Area := 3.14159 * FRadius * FRadius;
end;

constructor TRectangle.Create(width, height: Double);
begin
  FWidth := width;
  FHeight := height;
end;

function TRectangle.Area: Double;
begin
  Area := FWidth * FHeight;
end;

function CreateShape(kind: string; a, b: Double): TShape;
begin
  if kind = 'circle' then
    CreateShape := TCircle.Create(a)
  else if kind = 'rectangle' then
    CreateShape := TRectangle.Create(a, b)
  else
    CreateShape := nil;
end;

var
  shapes: array[0..1] of TShape;
  i: Integer;
begin
  shapes[0] := CreateShape('circle', 2.0, 0.0);
  shapes[1] := CreateShape('rectangle', 3.0, 4.0);
  for i := 0 to 1 do
    WriteLn(shapes[i].Area: 0: 2);
  for i := 0 to 1 do
    shapes[i].Free;
end.
