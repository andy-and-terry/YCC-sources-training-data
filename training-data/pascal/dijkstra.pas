program DijkstraDemo;

const
  NodeCount = 5;
  Infinity = 999999;

var
  graph: array[0..NodeCount - 1, 0..NodeCount - 1] of Integer;
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
    minDist := Infinity;
    u := -1;
    for i := 0 to NodeCount - 1 do
      if (not visited[i]) and (dist[i] < minDist) then
      begin
        minDist := dist[i];
        u := i;
      end;
    if u = -1 then Exit;
    visited[u] := True;
    for v := 0 to NodeCount - 1 do
      if (graph[u][v] > 0) and (not visited[v]) and (dist[u] + graph[u][v] < dist[v]) then
        dist[v] := dist[u] + graph[u][v];
  end;
end;

var
  i, j: Integer;
begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
      graph[i][j] := 0;

  graph[0][1] := 4; graph[1][0] := 4;
  graph[0][2] := 1; graph[2][0] := 1;
  graph[2][1] := 2; graph[1][2] := 2;
  graph[1][3] := 5; graph[3][1] := 5;
  graph[2][3] := 8; graph[3][2] := 8;
  graph[3][4] := 3; graph[4][3] := 3;

  Dijkstra(0);
  for i := 0 to NodeCount - 1 do
    WriteLn('Distance to ', i, ': ', dist[i]);
end.
