program BinarySearchDemo;

function BinarySearch(arr: array of Integer; target: Integer): Integer;
var
  low, high, mid: Integer;
begin
  low := Low(arr);
  high := High(arr);
  BinarySearch := -1;
  while low <= high do
  begin
    mid := (low + high) div 2;
    if arr[mid] = target then
    begin
      BinarySearch := mid;
      Exit;
    end
    else if arr[mid] < target then
      low := mid + 1
    else
      high := mid - 1;
  end;
end;

var
  sorted: array[0..6] of Integer = (1, 3, 5, 7, 9, 11, 13);
begin
  WriteLn(BinarySearch(sorted, 7));
  WriteLn(BinarySearch(sorted, 4));
end.
