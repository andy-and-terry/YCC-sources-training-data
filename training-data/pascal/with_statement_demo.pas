program WithStatementDemo;

type
  Point = record
    x, y: Integer;
  end;

var
  p: Point;
begin
  with p do
  begin
    x := 3;
    y := 4;
  end;
  WriteLn(p.x, ' ', p.y);
end.
