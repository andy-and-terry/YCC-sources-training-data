program GraphDfsDemo;

const
  NumVertices = 6;

var
  adj: array[0..NumVertices-1, 0..NumVertices-1] of Integer;
  visited: array[0..NumVertices-1] of Boolean;
  i, j: Integer;

procedure AddEdge(a, b: Integer);
begin
  adj[a, b] := 1;
  adj[b, a] := 1;
end;

procedure Dfs(v: Integer);
var
  i: Integer;
begin
  visited[v] := True;
  Write(v, ' ');
  for i := 0 to NumVertices - 1 do
    if (adj[v, i] = 1) and (not visited[i]) then Dfs(i);
end;

begin
  for i := 0 to NumVertices - 1 do
    for j := 0 to NumVertices - 1 do
      adj[i, j] := 0;
  AddEdge(0, 1);
  AddEdge(0, 2);
  AddEdge(1, 3);
  AddEdge(2, 4);
  AddEdge(3, 5);
  for i := 0 to NumVertices - 1 do visited[i] := False;
  Dfs(0);
  WriteLn;
end.
