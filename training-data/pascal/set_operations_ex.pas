program SetOperationsEx;
type
  TDigits = set of 0..9;
var
  A, B: TDigits;
  I: Integer;
begin
  A := [1, 2, 3, 4];
  B := [3, 4, 5];
  for I in A + B do Write(I, ' ');
  WriteLn;
  for I in A * B do Write(I, ' ');
  WriteLn;
  WriteLn(2 in A, ' ', 7 in A);
end.
