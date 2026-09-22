program DijkstraDemo;

const
  NodeCount = 5;
  Infinity = 30000;

type
  Matrix = array[0..NodeCount - 1, 0..NodeCount - 1] of Integer;

var
  graph: Matrix;
  dist: array[0..NodeCount - 1] of Integer;
  visited: array[0..NodeCount - 1] of Boolean;

procedure Dijkstra(source: Integer);
var
  i, u, v, minDist, count: Integer;
begin
  for i := 0 to NodeCount - 1 do
  begin
    dist[i] := Infinity;
    visited[i] := False;
  end;
  dist[source] := 0;

  for count := 0 to NodeCount - 1 do
  begin
    u := -1;
    minDist := Infinity + 1;
    for i := 0 to NodeCount - 1 do
      if (not visited[i]) and (dist[i] < minDist) then
      begin
        minDist := dist[i];
        u := i;
      end;
    if u = -1 then Break;
    visited[u] := True;

    for v := 0 to NodeCount - 1 do
      if (graph[u][v] > 0) and (dist[u] + graph[u][v] < dist[v]) then
        dist[v] := dist[u] + graph[u][v];
  end;
end;

var
  i, j: Integer;
begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
      graph[i][j] := 0;

  graph[0][1] := 4; graph[0][2] := 1;
  graph[2][1] := 2; graph[1][3] := 1;
  graph[2][3] := 5; graph[3][4] := 3;

  Dijkstra(0);
  for i := 0 to NodeCount - 1 do
    WriteLn('dist[', i, '] = ', dist[i]);
end.
