program DynamicArrayGetMemDemo;

type
  IntArray = array[0..0] of Integer;
  PIntArray = ^IntArray;

var
  arr: PIntArray;
  n, i: Integer;
begin
  n := 5;
  GetMem(arr, n * SizeOf(Integer));
  for i := 0 to n - 1 do arr^[i] := (i + 1) * (i + 1);
  for i := 0 to n - 1 do Write(arr^[i], ' ');
  WriteLn;
  FreeMem(arr, n * SizeOf(Integer));
end.
