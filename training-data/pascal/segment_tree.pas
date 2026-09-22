program SegmentTreeDemo;

const
  MaxN = 100;

var
  tree: array[0..4*MaxN] of Integer;

procedure Build(arr: array of Integer; node, start, stop: Integer);
var
  mid: Integer;
begin
  if start = stop then
    tree[node] := arr[start]
  else
  begin
    mid := (start + stop) div 2;
    Build(arr, 2*node, start, mid);
    Build(arr, 2*node+1, mid+1, stop);
    tree[node] := tree[2*node] + tree[2*node+1];
  end;
end;

function Query(node, start, stop, l, r: Integer): Integer;
var
  mid: Integer;
begin
  if (r < start) or (stop < l) then
  begin
    Query := 0;
    Exit;
  end;
  if (l <= start) and (stop <= r) then
  begin
    Query := tree[node];
    Exit;
  end;
  mid := (start + stop) div 2;
  Query := Query(2*node, start, mid, l, r) + Query(2*node+1, mid+1, stop, l, r);
end;

var
  values: array[0..5] of Integer = (1, 3, 5, 7, 9, 11);
begin
  Build(values, 1, 0, 5);
  WriteLn(Query(1, 0, 5, 1, 3));
  WriteLn(Query(1, 0, 5, 0, 5));
end.
