program HeapSortDemo;

var
  arr: array[0..7] of Integer = (5, 3, 8, 1, 9, 2, 7, 4);

procedure Swap(var a, b: Integer);
var
  t: Integer;
begin
  t := a;
  a := b;
  b := t;
end;

procedure SiftDown(var a: array of Integer; start, count: Integer);
var
  root, child: Integer;
begin
  root := start;
  while root * 2 + 1 < count do
  begin
    child := root * 2 + 1;
    if (child + 1 < count) and (a[child] < a[child + 1]) then
      child := child + 1;
    if a[root] < a[child] then
    begin
      Swap(a[root], a[child]);
      root := child;
    end
    else
      Break;
  end;
end;

procedure HeapSort(var a: array of Integer; count: Integer);
var
  i, endIdx: Integer;
begin
  for i := (count div 2) - 1 downto 0 do
    SiftDown(a, i, count);

  endIdx := count - 1;
  while endIdx > 0 do
  begin
    Swap(a[0], a[endIdx]);
    SiftDown(a, 0, endIdx);
    endIdx := endIdx - 1;
  end;
end;

var
  i: Integer;
begin
  HeapSort(arr, 8);
  for i := 0 to 7 do
    Write(arr[i], ' ');
  WriteLn;
end.
