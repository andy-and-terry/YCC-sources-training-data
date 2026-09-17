program BellmanFordDemo;

const
  NodeCount = 5;
  EdgeCount = 8;
  Inf = 999999;

type
  Edge = record
    src, dst, weight: Integer;
  end;

var
  edges: array[0..EdgeCount - 1] of Edge = (
    (src: 0; dst: 1; weight: 6),
    (src: 0; dst: 2; weight: 7),
    (src: 1; dst: 2; weight: 8),
    (src: 1; dst: 3; weight: 5),
    (src: 1; dst: 4; weight: -4),
    (src: 2; dst: 3; weight: -3),
    (src: 2; dst: 4; weight: 9),
    (src: 3; dst: 1; weight: -2)
  );
  dist: array[0..NodeCount - 1] of Integer;
  i, k: Integer;
  hasNegativeCycle: Boolean;

begin
  for i := 0 to NodeCount - 1 do
    dist[i] := Inf;
  dist[0] := 0;

  for k := 1 to NodeCount - 1 do
    for i := 0 to EdgeCount - 1 do
      if (dist[edges[i].src] <> Inf) and
         (dist[edges[i].src] + edges[i].weight < dist[edges[i].dst]) then
        dist[edges[i].dst] := dist[edges[i].src] + edges[i].weight;

  hasNegativeCycle := False;
  for i := 0 to EdgeCount - 1 do
    if (dist[edges[i].src] <> Inf) and
       (dist[edges[i].src] + edges[i].weight < dist[edges[i].dst]) then
      hasNegativeCycle := True;

  if hasNegativeCycle then
    WriteLn('negative cycle detected')
  else
    for i := 0 to NodeCount - 1 do
      WriteLn('dist[', i, '] = ', dist[i]);
end.
