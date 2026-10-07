program ThreeSumDemo;

var
  nums: array[0..5] of Integer = (-1, 0, 1, 2, -1, -4);
  n, i, left, right, total, temp, j: Integer;

begin
  n := 6;
  for i := 0 to n - 2 do
    for j := 0 to n - 2 - i do
      if nums[j] > nums[j + 1] then
      begin
        temp := nums[j]; nums[j] := nums[j + 1]; nums[j + 1] := temp;
      end;

  for i := 0 to n - 3 do
  begin
    if (i = 0) or (nums[i] <> nums[i - 1]) then
    begin
      left := i + 1;
      right := n - 1;
      while left < right do
      begin
        total := nums[i] + nums[left] + nums[right];
        if total = 0 then
        begin
          WriteLn(nums[i], ' ', nums[left], ' ', nums[right]);
          left := left + 1;
          right := right - 1;
        end
        else if total < 0 then
          left := left + 1
        else
          right := right - 1;
      end;
    end;
  end;
end.
