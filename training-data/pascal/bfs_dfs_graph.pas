program BfsDfsGraph;

const
  NodeCount = 5;

var
  adj: array[0..NodeCount - 1, 0..NodeCount - 1] of Boolean;
  visited: array[0..NodeCount - 1] of Boolean;
  q: array[0..NodeCount - 1] of Integer;

procedure BFS(start: Integer);
var
  head, tail, i, node: Integer;
begin
  for i := 0 to NodeCount - 1 do
    visited[i] := False;
  head := 0;
  tail := 0;
  q[tail] := start;
  tail := tail + 1;
  visited[start] := True;
  while head < tail do
  begin
    node := q[head];
    head := head + 1;
    Write(node, ' ');
    for i := 0 to NodeCount - 1 do
      if adj[node][i] and (not visited[i]) then
      begin
        visited[i] := True;
        q[tail] := i;
        tail := tail + 1;
      end;
  end;
  WriteLn;
end;

procedure DFS(node: Integer);
var
  i: Integer;
begin
  visited[node] := True;
  Write(node, ' ');
  for i := 0 to NodeCount - 1 do
    if adj[node][i] and (not visited[i]) then
      DFS(i);
end;

var
  i, j: Integer;
begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
      adj[i][j] := False;

  adj[0][1] := True; adj[1][0] := True;
  adj[0][2] := True; adj[2][0] := True;
  adj[1][3] := True; adj[3][1] := True;
  adj[2][3] := True; adj[3][2] := True;
  adj[3][4] := True; adj[4][3] := True;

  BFS(0);

  for i := 0 to NodeCount - 1 do
    visited[i] := False;
  DFS(0);
  WriteLn;
end.
