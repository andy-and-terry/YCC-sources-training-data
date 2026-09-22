program BellmanFordDemo;

{ Unlike Dijkstra, Bellman-Ford relaxes every edge NodeCount - 1 times,
  which still works correctly with negative edge weights as long as
  there is no negative-weight cycle reachable from the source. }

const
  NodeCount = 4;
  EdgeCount = 5;
  Infinity = 30000;

type
  TEdge = record
    From, ToNode, Weight: Integer;
  end;

var
  edges: array[0..EdgeCount - 1] of TEdge;
  dist: array[0..NodeCount - 1] of Integer;
  i, pass: Integer;

begin
  edges[0].From := 0; edges[0].ToNode := 1; edges[0].Weight := 4;
  edges[1].From := 0; edges[1].ToNode := 2; edges[1].Weight := 5;
  edges[2].From := 1; edges[2].ToNode := 2; edges[2].Weight := -3;
  edges[3].From := 2; edges[3].ToNode := 3; edges[3].Weight := 2;
  edges[4].From := 1; edges[4].ToNode := 3; edges[4].Weight := 6;

  for i := 0 to NodeCount - 1 do
    dist[i] := Infinity;
  dist[0] := 0;

  for pass := 1 to NodeCount - 1 do
    for i := 0 to EdgeCount - 1 do
      if (dist[edges[i].From] <> Infinity) and
         (dist[edges[i].From] + edges[i].Weight < dist[edges[i].ToNode]) then
        dist[edges[i].ToNode] := dist[edges[i].From] + edges[i].Weight;

  for i := 0 to NodeCount - 1 do
    WriteLn('dist[', i, '] = ', dist[i]);
end.
