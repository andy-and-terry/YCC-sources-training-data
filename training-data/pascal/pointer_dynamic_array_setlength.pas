program PointerDynamicArraySetLength;
var
  A: array of Integer;
  I: Integer;
begin
  SetLength(A, 5);
  for I := 0 to High(A) do A[I] := I * I;
  SetLength(A, 7);
  A[5] := 100; A[6] := 200;
  for I := 0 to High(A) do Write(A[I], ' ');
  WriteLn;
  WriteLn(Length(A));
end.
