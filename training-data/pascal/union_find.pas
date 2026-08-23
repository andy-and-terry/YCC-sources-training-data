program UnionFindDemo;

var
  parent: array[0..4] of Integer;

function Find(x: Integer): Integer;
begin
  if parent[x] = x then Find := x
  else Find := Find(parent[x]);
end;

procedure Union(x, y: Integer);
var
  rootX, rootY: Integer;
begin
  rootX := Find(x);
  rootY := Find(y);
  if rootX <> rootY then parent[rootX] := rootY;
end;

var
  i: Integer;
begin
  for i := 0 to 4 do parent[i] := i;
  Union(0, 1);
  Union(1, 2);
  WriteLn(Find(0) = Find(2));
  WriteLn(Find(0) = Find(3));
end.
