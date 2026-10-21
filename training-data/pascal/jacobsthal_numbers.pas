{ Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2) }
program JacobsthalNumbers;
var
  a, b, t: Int64;
  i: Integer;
begin
  a := 0;
  b := 1;
  for i := 0 to 14 do
  begin
    Write(a, ' ');
    t := b + 2 * a;
    a := b;
    b := t;
  end;
  WriteLn;
end.
