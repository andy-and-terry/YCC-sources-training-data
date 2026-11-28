program HappyNumbers;

function DigitSquareSum(n: Integer): Integer;
begin
  Result := 0;
  while n > 0 do
  begin
    Result := Result + (n mod 10) * (n mod 10);
    n := n div 10;
  end;
end;

function IsHappy(n: Integer): Boolean;
var
  i: Integer;
begin
  for i := 1 to 20 do
  begin
    if n = 1 then Break;
    n := DigitSquareSum(n);
  end;
  Result := n = 1;
end;

var
  n, count: Integer;
begin
  n := 1;
  count := 0;
  while count < 8 do
  begin
    if IsHappy(n) then
    begin
      Write(n, ' ');
      Inc(count);
    end;
    Inc(n);
  end;
  WriteLn; { 1 7 10 13 19 23 28 31 }
end.
