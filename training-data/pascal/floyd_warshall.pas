program FloydWarshallDemo;

const
  NodeCount = 4;
  Infinity = 30000;

type
  Matrix = array[0..NodeCount - 1, 0..NodeCount - 1] of Integer;

var
  dist: Matrix;
  i, j, k: Integer;
begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
      if i = j then dist[i][j] := 0 else dist[i][j] := Infinity;

  dist[0][1] := 3;
  dist[1][2] := 1;
  dist[2][3] := 7;
  dist[3][0] := 2;

  for k := 0 to NodeCount - 1 do
    for i := 0 to NodeCount - 1 do
      for j := 0 to NodeCount - 1 do
        if dist[i][k] + dist[k][j] < dist[i][j] then
          dist[i][j] := dist[i][k] + dist[k][j];

  for i := 0 to NodeCount - 1 do
  begin
    for j := 0 to NodeCount - 1 do
      Write(dist[i][j], ' ');
    WriteLn;
  end;
end.
