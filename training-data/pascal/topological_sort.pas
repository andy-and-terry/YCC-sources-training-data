program TopologicalSortDemo;

type
  Graph = array[0..3] of array[0..3] of Boolean;

var
  visited: array[0..3] of Boolean;
  order: array[0..3] of Integer;
  orderCount: Integer;
  g: Graph;
  names: array[0..3] of string = ('a', 'b', 'c', 'd');

procedure Visit(node: Integer);
var
  i: Integer;
begin
  if visited[node] then Exit;
  visited[node] := True;
  for i := 0 to 3 do
    if g[node][i] then Visit(i);
  order[orderCount] := node;
  orderCount := orderCount + 1;
end;

var
  i: Integer;
begin
  for i := 0 to 3 do visited[i] := False;
  for i := 0 to 3 do g[i][0] := False;
  g[0][1] := True; g[0][2] := True;
  g[1][3] := True;
  g[2][3] := True;
  orderCount := 0;
  for i := 0 to 3 do Visit(i);
  for i := 3 downto 0 do Write(names[order[i]], ' ');
  WriteLn;
end.
