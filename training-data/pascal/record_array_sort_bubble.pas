program RecSort;
type R = record n: string; a: integer; end;
var xs: array[1..3] of R; i, j: integer; t: R;
begin
  xs[1].n := 'c'; xs[1].a := 30; xs[2].n := 'a'; xs[2].a := 10; xs[3].n := 'b'; xs[3].a := 20;
  for i := 1 to 2 do for j := 1 to 3 - i do
    if xs[j].a > xs[j+1].a then begin t := xs[j]; xs[j] := xs[j+1]; xs[j+1] := t; end;
  for i := 1 to 3 do writeln(xs[i].n, ' ', xs[i].a);
end.
