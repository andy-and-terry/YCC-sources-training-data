program PrimesBelowCount;

function CountPrimesBelow(N: Integer): Integer;
var
  Composite: array of Boolean;
  I, J: Integer;
begin
  Result := 0;
  if N < 3 then Exit;
  SetLength(Composite, N);
  for I := 2 to N - 1 do
  begin
    if Composite[I] then Continue;
    Inc(Result);
    J := I * I;
    while J < N do
    begin
      Composite[J] := True;
      J := J + I;
    end;
  end;
end;

begin
  WriteLn(CountPrimesBelow(100));
end.
