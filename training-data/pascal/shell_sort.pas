program ShellSortDemo;

const
  N = 8;

var
  nums: array[0..N-1] of Integer = (23, 12, 1, 8, 4, 9, 42, 3);
  gap, i, j, temp: Integer;
begin
  gap := N div 2;
  while gap > 0 do
  begin
    for i := gap to N - 1 do
    begin
      temp := nums[i];
      j := i;
      while (j >= gap) and (nums[j - gap] > temp) do
      begin
        nums[j] := nums[j - gap];
        j := j - gap;
      end;
      nums[j] := temp;
    end;
    gap := gap div 2;
  end;
  for i := 0 to N - 1 do Write(nums[i], ' ');
  WriteLn;
end.
