program MaxSubarrayDemo;

var
  items: array[0..8] of Integer = (-2, 1, -3, 4, -1, 2, 1, -5, 4);
  best, current, i: Integer;
begin
  best := items[0];
  current := items[0];
  for i := 1 to 8 do
  begin
    if items[i] > current + items[i] then current := items[i]
    else current := current + items[i];
    if current > best then best := current;
  end;
  WriteLn(best);
end.
