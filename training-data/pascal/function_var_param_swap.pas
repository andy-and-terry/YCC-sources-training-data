program VarParam;
procedure swap(var a, b: integer);
var t: integer;
begin t := a; a := b; b := t; end;
var x, y: integer;
begin x := 1; y := 2; swap(x, y); writeln(x, ' ', y); end.
