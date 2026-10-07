program DutchNationalFlagDemo;

var
  nums: array[0..5] of Integer = (2, 0, 2, 1, 1, 0);
  low, mid, high, temp, i: Integer;

begin
  low := 0;
  mid := 0;
  high := 5;
  while mid <= high do
  begin
    if nums[mid] = 0 then
    begin
      temp := nums[low]; nums[low] := nums[mid]; nums[mid] := temp;
      low := low + 1;
      mid := mid + 1;
    end
    else if nums[mid] = 1 then
      mid := mid + 1
    else
    begin
      temp := nums[mid]; nums[mid] := nums[high]; nums[high] := temp;
      high := high - 1;
    end;
  end;
  for i := 0 to 5 do Write(nums[i], ' ');
  WriteLn;
end.
