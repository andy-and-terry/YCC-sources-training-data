program CountingSortDemo;

const
  MaxValue = 100;

type
  IntArray = array[0..99] of Integer;
  CountArray = array[0..MaxValue] of Integer;

procedure CountingSort(var arr: IntArray; n: Integer);
var
  count: CountArray;
  output: IntArray;
  i, v: Integer;
begin
  for i := 0 to MaxValue do
    count[i] := 0;
  for i := 0 to n - 1 do
    count[arr[i]] := count[arr[i]] + 1;
  for i := 1 to MaxValue do
    count[i] := count[i] + count[i - 1];
  for i := n - 1 downto 0 do
  begin
    v := arr[i];
    output[count[v] - 1] := v;
    count[v] := count[v] - 1;
  end;
  for i := 0 to n - 1 do
    arr[i] := output[i];
end;

var
  data: IntArray;
  i: Integer;
begin
  data[0] := 4; data[1] := 2; data[2] := 2; data[3] := 8;
  data[4] := 3; data[5] := 3; data[6] := 1; data[7] := 0;
  CountingSort(data, 8);
  for i := 0 to 7 do
    Write(data[i], ' ');
  WriteLn;
end.
