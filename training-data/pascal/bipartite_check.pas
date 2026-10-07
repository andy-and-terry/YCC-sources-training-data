program BipartiteCheckDemo;

const
  NodeCount = 4;

type
  Matrix = array[0..NodeCount - 1, 0..NodeCount - 1] of Boolean;

function IsBipartite(const graph: Matrix): Boolean;
var
  color: array[0..NodeCount - 1] of Integer;
  queue: array[0..NodeCount - 1] of Integer;
  head, tail, u, v, start: Integer;
begin
  for u := 0 to NodeCount - 1 do color[u] := -1;

  for start := 0 to NodeCount - 1 do
  begin
    if color[start] <> -1 then Continue;
    color[start] := 0;
    head := 0;
    tail := 0;
    queue[tail] := start;
    tail := tail + 1;

    while head < tail do
    begin
      u := queue[head];
      head := head + 1;
      for v := 0 to NodeCount - 1 do
        if graph[u][v] then
        begin
          if color[v] = -1 then
          begin
            color[v] := 1 - color[u];
            queue[tail] := v;
            tail := tail + 1;
          end
          else if color[v] = color[u] then
          begin
            IsBipartite := False;
            Exit;
          end;
        end;
    end;
  end;
  IsBipartite := True;
end;

var
  evenCycle, oddCycle: Matrix;
  i, j: Integer;
begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
    begin
      evenCycle[i][j] := False;
      oddCycle[i][j] := False;
    end;

  evenCycle[0][1] := True; evenCycle[1][0] := True;
  evenCycle[1][2] := True; evenCycle[2][1] := True;
  evenCycle[2][3] := True; evenCycle[3][2] := True;
  evenCycle[3][0] := True; evenCycle[0][3] := True;

  oddCycle[0][1] := True; oddCycle[1][0] := True;
  oddCycle[1][2] := True; oddCycle[2][1] := True;
  oddCycle[2][0] := True; oddCycle[0][2] := True;

  WriteLn(IsBipartite(evenCycle));
  WriteLn(IsBipartite(oddCycle));
end.
