program PrefixRangeSum;

const
  Values: array[0..7] of Integer = (3, 1, 4, 1, 5, 9, 2, 6);

var
  Prefix: array[0..8] of Integer;
  I: Integer;

function Query(Lo, Hi: Integer): Integer;
begin
  Result := Prefix[Hi] - Prefix[Lo];
end;

begin
  Prefix[0] := 0;
  for I := 0 to 7 do
    Prefix[I + 1] := Prefix[I] + Values[I];
  WriteLn(Query(2, 5));
end.
