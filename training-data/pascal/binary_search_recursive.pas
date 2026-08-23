program BinarySearchRecursiveDemo;

function BinarySearch(arr: array of Integer; low, high, target: Integer): Integer;
var
  mid: Integer;
begin
  if low > high then begin BinarySearch := -1; Exit; end;
  mid := (low + high) div 2;
  if arr[mid] = target then BinarySearch := mid
  else if arr[mid] < target then BinarySearch := BinarySearch(arr, mid + 1, high, target)
  else BinarySearch := BinarySearch(arr, low, mid - 1, target);
end;

var
  data: array[0..5] of Integer = (1, 3, 5, 7, 9, 11);
begin
  WriteLn(BinarySearch(data, 0, 5, 7));
end.
