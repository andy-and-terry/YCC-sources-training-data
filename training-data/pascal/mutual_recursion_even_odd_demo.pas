program MutualRecursionEvenOddDemo;

function IsOdd(n: Integer): Boolean; forward;

function IsEven(n: Integer): Boolean;
begin
  if n = 0 then Result := True
  else Result := IsOdd(n - 1);
end;

function IsOdd(n: Integer): Boolean;
begin
  if n = 0 then Result := False
  else Result := IsEven(n - 1);
end;

var
  i: Integer;
begin
  for i := 0 to 6 do
    WriteLn(i, ' even=', IsEven(i), ' odd=', IsOdd(i));
end.
