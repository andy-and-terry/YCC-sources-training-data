program TernarySearchDemo;

function TernarySearch(const arr: array of Integer; target: Integer): Integer;
var
  lo, hi, third, m1, m2: Integer;
begin
  lo := Low(arr);
  hi := High(arr);
  TernarySearch := -1;
  while lo <= hi do
  begin
    third := (hi - lo) div 3;
    m1 := lo + third;
    m2 := hi - third;
    if arr[m1] = target then
    begin
      TernarySearch := m1;
      Exit;
    end;
    if arr[m2] = target then
    begin
      TernarySearch := m2;
      Exit;
    end;
    if target < arr[m1] then hi := m1 - 1
    else if target > arr[m2] then lo := m2 + 1
    else
    begin
      lo := m1 + 1;
      hi := m2 - 1;
    end;
  end;
end;

var
  arr: array[0..7] of Integer = (1, 3, 5, 7, 9, 11, 13, 15);
begin
  WriteLn(TernarySearch(arr, 9));
  WriteLn(TernarySearch(arr, 4));
end.
