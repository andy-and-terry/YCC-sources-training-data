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
      if i = j then dist[i][j] := 0
      else dist[i][j] := Infinity;

  dist[0][1] := 5;
  dist[0][3] := 10;
  dist[1][2] := 3;
  dist[2][3] := 1;

  for k := 0 to NodeCount - 1 do
    for i := 0 to NodeCount - 1 do
      for j := 0 to NodeCount - 1 do
        if (dist[i][k] < Infinity) and (dist[k][j] < Infinity) and
           (dist[i][k] + dist[k][j] < dist[i][j]) then
          dist[i][j] := dist[i][k] + dist[k][j];

  for i := 0 to NodeCount - 1 do
  begin
    for j := 0 to NodeCount - 1 do
      Write(dist[i][j], ' ');
    WriteLn;
  end;
end.
