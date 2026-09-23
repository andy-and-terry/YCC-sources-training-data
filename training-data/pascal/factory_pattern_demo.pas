{$mode objfpc}
program FactoryPatternDemo;

type
  TShapeKind = (skCircle, skSquare);

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

  TSquare = class(TShape)
  private
    FSide: Double;
  public
    constructor Create(side: Double);
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

constructor TSquare.Create(side: Double);
begin
  FSide := side;
end;

function TSquare.Area: Double;
begin
  Area := FSide * FSide;
end;

function CreateShape(kind: TShapeKind): TShape;
begin
  case kind of
    skCircle: CreateShape := TCircle.Create(2.0);
    skSquare: CreateShape := TSquare.Create(3.0);
  else
    CreateShape := nil;
  end;
end;

var
  shape: TShape;
begin
  shape := CreateShape(skCircle);
  WriteLn(shape.Area:0:2);
  shape := CreateShape(skSquare);
  WriteLn(shape.Area:0:2);
end.
