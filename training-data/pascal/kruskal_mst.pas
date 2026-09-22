program KruskalMstDemo;

const
  MaxEdges = 10;
  MaxVertices = 5;

type
  TEdge = record
    src, dst, weight: Integer;
  end;

var
  edges: array[0..MaxEdges-1] of TEdge;
  parent, rnk: array[0..MaxVertices-1] of Integer;
  edgeCount, numVertices: Integer;

function Find(x: Integer): Integer;
begin
  if parent[x] <> x then
    parent[x] := Find(parent[x]);
  Find := parent[x];
end;

function UnionSets(x, y: Integer): Boolean;
var
  rootX, rootY: Integer;
begin
  rootX := Find(x);
  rootY := Find(y);
  if rootX = rootY then
  begin
    UnionSets := False;
    Exit;
  end;
  if rnk[rootX] < rnk[rootY] then
    parent[rootX] := rootY
  else if rnk[rootX] > rnk[rootY] then
    parent[rootY] := rootX
  else
  begin
    parent[rootY] := rootX;
    rnk[rootX] := rnk[rootX] + 1;
  end;
  UnionSets := True;
end;

procedure SortEdges;
var
  i, j: Integer;
  temp: TEdge;
begin
  for i := 0 to edgeCount - 2 do
    for j := 0 to edgeCount - 2 - i do
      if edges[j].weight > edges[j + 1].weight then
      begin
        temp := edges[j];
        edges[j] := edges[j + 1];
        edges[j + 1] := temp;
      end;
end;

var
  i, totalWeight: Integer;
begin
  numVertices := 5;
  edgeCount := 6;
  edges[0].src := 0; edges[0].dst := 1; edges[0].weight := 4;
  edges[1].src := 0; edges[1].dst := 2; edges[1].weight := 4;
  edges[2].src := 1; edges[2].dst := 2; edges[2].weight := 2;
  edges[3].src := 2; edges[3].dst := 3; edges[3].weight := 3;
  edges[4].src := 3; edges[4].dst := 4; edges[4].weight := 2;
  edges[5].src := 4; edges[5].dst := 2; edges[5].weight := 3;

  SortEdges;

  for i := 0 to numVertices - 1 do parent[i] := i;
  for i := 0 to numVertices - 1 do rnk[i] := 0;

  totalWeight := 0;
  for i := 0 to edgeCount - 1 do
    if UnionSets(edges[i].src, edges[i].dst) then
    begin
      WriteLn(edges[i].src, ' - ', edges[i].dst, ' : ', edges[i].weight);
      totalWeight := totalWeight + edges[i].weight;
    end;

  WriteLn('total: ', totalWeight);
end.
