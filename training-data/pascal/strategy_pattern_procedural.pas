program StrategyPatternDemo;

type
  TCompareFunc = function(a, b: Integer): Boolean;

function Ascending(a, b: Integer): Boolean;
begin
  Ascending := a < b;
end;

function Descending(a, b: Integer): Boolean;
begin
  Descending := a > b;
end;

procedure SortWithStrategy(var arr: array of Integer; size: Integer; strategy: TCompareFunc);
var
  i, j, temp: Integer;
begin
  for i := 0 to size - 2 do
    for j := 0 to size - 2 - i do
      if not strategy(arr[j], arr[j + 1]) and (arr[j] <> arr[j + 1]) then
      begin
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
      end;
end;

var
  data: array[0..5] of Integer = (5, 3, 8, 1, 9, 2);
  i: Integer;
  currentStrategy: TCompareFunc;
begin
  currentStrategy := @Ascending;
  SortWithStrategy(data, 6, currentStrategy);
  for i := 0 to 5 do Write(data[i], ' ');
  WriteLn;

  currentStrategy := @Descending;
  SortWithStrategy(data, 6, currentStrategy);
  for i := 0 to 5 do Write(data[i], ' ');
  WriteLn;
end.
