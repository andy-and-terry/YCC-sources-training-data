program DijkstraDemo;

const
  NodeCount = 5;
  Inf = 999999;

var
  adj: array[0..NodeCount - 1, 0..NodeCount - 1] of Integer;
  dist: array[0..NodeCount - 1] of Integer;
  visited: array[0..NodeCount - 1] of Boolean;
  i, j, u, minDist, alt: Integer;

begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
      adj[i][j] := Inf;

  adj[0][1] := 4; adj[0][2] := 1;
  adj[2][1] := 2; adj[1][3] := 1;
  adj[2][3] := 5; adj[3][4] := 3;
  adj[1][4] := 6;

  for i := 0 to NodeCount - 1 do
  begin
    dist[i] := Inf;
    visited[i] := False;
  end;
  dist[0] := 0;

  for i := 0 to NodeCount - 1 do
  begin
    u := -1;
    minDist := Inf + 1;
    for j := 0 to NodeCount - 1 do
      if (not visited[j]) and (dist[j] < minDist) then
      begin
        minDist := dist[j];
        u := j;
      end;
    if u = -1 then Break;
    visited[u] := True;
    for j := 0 to NodeCount - 1 do
      if (adj[u][j] < Inf) and (not visited[j]) then
      begin
        alt := dist[u] + adj[u][j];
        if alt < dist[j] then dist[j] := alt;
      end;
  end;

  for i := 0 to NodeCount - 1 do
    WriteLn('dist[', i, '] = ', dist[i]);
end.
