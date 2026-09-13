program MonotonicStackDemo;

const
  MaxN = 100;

var
  nums: array[0..MaxN-1] of Integer;
  result_: array[0..MaxN-1] of Integer;
  stack: array[0..MaxN-1] of Integer;
  top: Integer;
  n, i: Integer;
begin
  n := 5;
  nums[0] := 2; nums[1] := 1; nums[2] := 2; nums[3] := 4; nums[4] := 3;
  for i := 0 to n - 1 do result_[i] := -1;
  top := -1;
  for i := 0 to n - 1 do
  begin
    while (top >= 0) and (nums[stack[top]] < nums[i]) do
    begin
      result_[stack[top]] := nums[i];
      top := top - 1;
    end;
    top := top + 1;
    stack[top] := i;
  end;
  for i := 0 to n - 1 do
    Write(result_[i], ' ');
  WriteLn;
end.
