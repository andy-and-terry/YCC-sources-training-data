program CycleDetectionDemo;

const
  NodeCount = 4;

type
  NodeState = (nsUnvisited, nsVisiting, nsDone);

var
  adj: array[0..NodeCount - 1, 0..NodeCount - 1] of Boolean;
  state: array[0..NodeCount - 1] of NodeState;

function VisitNode(node: Integer): Boolean;
var
  i: Integer;
begin
  state[node] := nsVisiting;
  VisitNode := False;
  for i := 0 to NodeCount - 1 do
    if adj[node][i] then
    begin
      if state[i] = nsVisiting then
      begin
        VisitNode := True;
        Exit;
      end
      else if (state[i] = nsUnvisited) and VisitNode(i) then
      begin
        VisitNode := True;
        Exit;
      end;
    end;
  state[node] := nsDone;
end;

function HasCycle: Boolean;
var
  i: Integer;
begin
  for i := 0 to NodeCount - 1 do
    state[i] := nsUnvisited;
  HasCycle := False;
  for i := 0 to NodeCount - 1 do
    if (state[i] = nsUnvisited) and VisitNode(i) then
    begin
      HasCycle := True;
      Exit;
    end;
end;

var
  i, j: Integer;
begin
  for i := 0 to NodeCount - 1 do
    for j := 0 to NodeCount - 1 do
      adj[i][j] := False;
  adj[0][1] := True;
  adj[1][2] := True;
  adj[2][3] := True;
  WriteLn('acyclic graph has cycle: ', HasCycle);

  adj[3][1] := True; { introduces a back edge }
  WriteLn('cyclic graph has cycle: ', HasCycle);
end.
