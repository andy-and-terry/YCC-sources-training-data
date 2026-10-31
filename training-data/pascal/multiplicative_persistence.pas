program MultiplicativePersistence;

function Persistence(n: Int64): Integer;
var
  steps: Integer;
  product: Int64;
begin
  steps := 0;
  while n >= 10 do
  begin
    product := 1;
    while n > 0 do
    begin
      product := product * (n mod 10);
      n := n div 10;
    end;
    n := product;
    Inc(steps);
  end;
  Persistence := steps;
end;

begin
  WriteLn(39, ' ', Persistence(39));
  WriteLn(77, ' ', Persistence(77));
  WriteLn(999, ' ', Persistence(999));
  WriteLn(10, ' ', Persistence(10));
end.
