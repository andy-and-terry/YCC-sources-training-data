program VarParams;
procedure swap(var a, b: Integer);
var t: Integer;
begin t := a; a := b; b := t end;
var x, y: Integer;
begin
  x := 1; y := 2;
  swap(x, y);
  writeln(x, ' ', y);
end.
