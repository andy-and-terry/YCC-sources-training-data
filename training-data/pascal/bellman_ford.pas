program BellmanFordDemo;

const
  VertexCount = 5;
  EdgeCount = 8;
  Infinity = 30000;

type
  TEdge = record
    u, v, w: Integer;
  end;

var
  edges: array[0..EdgeCount - 1] of TEdge = (
    (u: 0; v: 1; w: -1),
    (u: 0; v: 2; w: 4),
    (u: 1; v: 2; w: 3),
    (u: 1; v: 3; w: 2),
    (u: 1; v: 4; w: 2),
    (u: 3; v: 2; w: 5),
    (u: 3; v: 1; w: 1),
    (u: 4; v: 3; w: -3)
  );
  dist: array[0..VertexCount - 1] of Integer;
  hasNegativeCycle: Boolean;
  i, j: Integer;
begin
  for i := 0 to VertexCount - 1 do dist[i] := Infinity;
  dist[0] := 0;

  for i := 1 to VertexCount - 1 do
    for j := 0 to EdgeCount - 1 do
      if (dist[edges[j].u] <> Infinity) and (dist[edges[j].u] + edges[j].w < dist[edges[j].v]) then
        dist[edges[j].v] := dist[edges[j].u] + edges[j].w;

  hasNegativeCycle := False;
  for j := 0 to EdgeCount - 1 do
    if (dist[edges[j].u] <> Infinity) and (dist[edges[j].u] + edges[j].w < dist[edges[j].v]) then
      hasNegativeCycle := True;

  for i := 0 to VertexCount - 1 do
    WriteLn('dist[', i, '] = ', dist[i]);
  WriteLn('negative cycle: ', hasNegativeCycle);
end.
