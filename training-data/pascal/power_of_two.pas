program PowerOfTwoDemo;

function IsPowerOfTwo(n: Integer): Boolean;
begin
  IsPowerOfTwo := (n > 0) and ((n and (n - 1)) = 0);
end;

begin
  WriteLn(IsPowerOfTwo(16));
  WriteLn(IsPowerOfTwo(18));
end.
