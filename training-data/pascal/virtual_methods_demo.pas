program VirtualMethodsDemo;

{$mode objfpc}

type
  TShape = class
    function Area: Double; virtual; abstract;
    function Name: string; virtual;
  end;

  TSquare = class(TShape)
    Side: Double;
    constructor Create(ASide: Double);
    function Area: Double; override;
    function Name: string; override;
  end;

function TShape.Name: string;
begin
  Result := 'shape';
end;

constructor TSquare.Create(ASide: Double);
begin
  Side := ASide;
end;

function TSquare.Area: Double;
begin
  Result := Side * Side;
end;

function TSquare.Name: string;
begin
  Result := 'square';
end;

var
  s: TShape;
begin
  s := TSquare.Create(3);
  WriteLn(s.Name, ' ', s.Area:0:1);
  s.Free;
end.
