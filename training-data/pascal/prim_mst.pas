program PrimMstDemo;

const
  N = 5;

var
  graph: array[0..N - 1, 0..N - 1] of Integer = (
    (0, 2, 0, 6, 0),
    (2, 0, 3, 8, 5),
    (0, 3, 0, 0, 7),
    (6, 8, 0, 0, 9),
    (0, 5, 7, 9, 0)
  );
  key: array[0..N - 1] of Integer;
  inMst: array[0..N - 1] of Boolean;
  i, v, u, count, total: Integer;

begin
  for i := 0 to N - 1 do
  begin
    key[i] := MaxInt;
    inMst[i] := False;
  end;
  key[0] := 0;
  total := 0;

  for count := 0 to N - 1 do
  begin
    u := -1;
    for v := 0 to N - 1 do
      if (not inMst[v]) and ((u = -1) or (key[v] < key[u])) then u := v;
    inMst[u] := True;
    total := total + key[u];
    for v := 0 to N - 1 do
      if (graph[u][v] <> 0) and (not inMst[v]) and (graph[u][v] < key[v]) then
        key[v] := graph[u][v];
  end;

  WriteLn(total);
end.
