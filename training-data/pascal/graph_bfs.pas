program GraphBfsDemo;

const
  NumVertices = 6;

var
  adj: array[0..NumVertices-1, 0..NumVertices-1] of Integer;
  visited: array[0..NumVertices-1] of Boolean;
  queue: array[0..NumVertices-1] of Integer;
  head, tail, i, j, current: Integer;

procedure AddEdge(a, b: Integer);
begin
  adj[a, b] := 1;
  adj[b, a] := 1;
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
  head := 0;
  tail := 0;
  queue[tail] := 0;
  tail := tail + 1;
  visited[0] := True;
  while head < tail do
  begin
    current := queue[head];
    head := head + 1;
    Write(current, ' ');
    for i := 0 to NumVertices - 1 do
      if (adj[current, i] = 1) and (not visited[i]) then
      begin
        visited[i] := True;
        queue[tail] := i;
        tail := tail + 1;
      end;
  end;
  WriteLn;
end.
