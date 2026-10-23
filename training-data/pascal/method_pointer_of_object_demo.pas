{$mode objfpc}{$H+}
program MethodPointerDemo;

type
  TOperation = function(a, b: Integer): Integer of object;

  TCalculator = class
    Offset: Integer;
    function Add(a, b: Integer): Integer;
    function Mul(a, b: Integer): Integer;
  end;

function TCalculator.Add(a, b: Integer): Integer;
begin
  Result := a + b + Offset;
end;

function TCalculator.Mul(a, b: Integer): Integer;
begin
  Result := a * b + Offset;
end;

procedure Apply(op: TOperation; x, y: Integer);
begin
  WriteLn(op(x, y));
end;

var
  c: TCalculator;
  op: TOperation;
begin
  c := TCalculator.Create;
  try
    c.Offset := 100;
    op := @c.Add;
    Apply(op, 2, 3);
    op := @c.Mul;
    Apply(op, 2, 3);
    c.Offset := 0;
    Apply(op, 4, 5);
  finally
    c.Free;
  end;
end.
