program PronicNumbers;

function IsPronic(x: Integer): Boolean;
var
  n: Integer;
begin
  n := Trunc(Sqrt(x));
  Result := n * (n + 1) = x;
end;

var
  n: Integer;
begin
  for n := 0 to 9 do Write(n * (n + 1), ' ');
  WriteLn; { 0 2 6 12 20 30 42 56 72 90 }
  WriteLn(IsPronic(56), ' ', IsPronic(57)); { TRUE FALSE }
end.
