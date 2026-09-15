program FenwickTreeDemo;

const
  MaxN = 100;

var
  tree: array[0..MaxN] of Integer;
  n: Integer;

procedure FenwickUpdate(i, delta: Integer);
var
  idx: Integer;
begin
  idx := i + 1;
  while idx <= n do
  begin
    tree[idx] := tree[idx] + delta;
    idx := idx + (idx and (-idx));
  end;
end;

function PrefixSum(i: Integer): Integer;
var
  idx, total: Integer;
begin
  idx := i + 1;
  total := 0;
  while idx > 0 do
  begin
    total := total + tree[idx];
    idx := idx - (idx and (-idx));
  end;
  PrefixSum := total;
end;

function RangeSum(l, r: Integer): Integer;
begin
  if l = 0 then
    RangeSum := PrefixSum(r)
  else
    RangeSum := PrefixSum(r) - PrefixSum(l - 1);
end;

var
  values: array[0..7] of Integer = (3, 2, -1, 6, 5, 4, -3, 3);
  i: Integer;
begin
  n := 8;
  for i := 0 to n do tree[i] := 0;
  for i := 0 to 7 do FenwickUpdate(i, values[i]);
  WriteLn(PrefixSum(5));
  WriteLn(RangeSum(2, 6));
  FenwickUpdate(0, 4);
  WriteLn(PrefixSum(5));
end.
