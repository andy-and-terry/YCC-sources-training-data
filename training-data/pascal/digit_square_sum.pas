program DigitSquareSum;

function Compute(N: Integer): Integer;
var
  D: Integer;
begin
  N := Abs(N);
  Result := 0;
  while N > 0 do
  begin
    D := N mod 10;
    Result := Result + D * D;
    N := N div 10;
  end;
end;

begin
  WriteLn(Compute(123));
  WriteLn(Compute(-99));
end.
