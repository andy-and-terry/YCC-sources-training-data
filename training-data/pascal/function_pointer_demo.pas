program FunctionPointerDemo;

type
  TIntTransform = function(x: Integer): Integer;

function Square(x: Integer): Integer;
begin
  Square := x * x;
end;

function Negate(x: Integer): Integer;
begin
  Negate := -x;
end;

procedure ApplyToAll(var arr: array of Integer; transform: TIntTransform);
var
  i: Integer;
begin
  for i := Low(arr) to High(arr) do
    arr[i] := transform(arr[i]);
end;

procedure PrintArray(const arr: array of Integer);
var
  i: Integer;
begin
  for i := Low(arr) to High(arr) do
    Write(arr[i], ' ');
  WriteLn;
end;

var
  numbers: array[0..4] of Integer = (1, 2, 3, 4, 5);
  op: TIntTransform;
begin
  op := @Square;
  ApplyToAll(numbers, op);
  PrintArray(numbers);

  op := @Negate;
  ApplyToAll(numbers, op);
  PrintArray(numbers);
end.
