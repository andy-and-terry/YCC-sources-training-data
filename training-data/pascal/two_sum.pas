program TwoSumDemo;

var
  nums: array[0..3] of Integer = (2, 7, 11, 15);
  target, i, j: Integer;
  found: Boolean;
begin
  target := 9;
  found := False;
  for i := 0 to 2 do
    for j := i + 1 to 3 do
      if (not found) and (nums[i] + nums[j] = target) then
      begin
        WriteLn(i, ' ', j);
        found := True;
      end;
end.
