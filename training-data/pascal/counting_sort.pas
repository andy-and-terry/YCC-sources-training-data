program CountingSortDemo;

const
  N = 8;
  MaxVal = 9;

var
  nums: array[0..N-1] of Integer = (4, 2, 2, 8, 3, 3, 1, 0);
  counts: array[0..MaxVal] of Integer;
  sorted: array[0..N-1] of Integer;
  i, j, pos: Integer;
begin
  for i := 0 to MaxVal do counts[i] := 0;
  for i := 0 to N - 1 do counts[nums[i]] := counts[nums[i]] + 1;
  for i := 1 to MaxVal do counts[i] := counts[i] + counts[i - 1];
  for i := N - 1 downto 0 do
  begin
    pos := counts[nums[i]] - 1;
    sorted[pos] := nums[i];
    counts[nums[i]] := counts[nums[i]] - 1;
  end;
  for j := 0 to N - 1 do Write(sorted[j], ' ');
  WriteLn;
end.
