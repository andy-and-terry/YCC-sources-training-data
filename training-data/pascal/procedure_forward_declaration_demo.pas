program ForwardDeclarationDemo;

function IsEven(n: Integer): Boolean; forward;

function IsOdd(n: Integer): Boolean;
begin
  if n = 0 then
    IsOdd := False
  else
    IsOdd := IsEven(n - 1);
end;

function IsEven(n: Integer): Boolean;
begin
  if n = 0 then
    IsEven := True
  else
    IsEven := IsOdd(n - 1);
end;

var
  i: Integer;
begin
  for i := 0 to 6 do
    if IsEven(i) then
      WriteLn(i, ' is even')
    else
      WriteLn(i, ' is odd');
end.
