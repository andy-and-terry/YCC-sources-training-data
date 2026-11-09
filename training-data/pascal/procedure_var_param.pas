program ProcedureVarParam;
procedure Swap(var a, b: Integer);
var t: Integer;
begin
  t := a; a := b; b := t;
end;
var x, y: Integer;
begin
  x := 1; y := 2;
  Swap(x, y);
  WriteLn(x, ' ', y);
end.
