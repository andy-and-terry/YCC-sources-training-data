program HammingNumbers;
{ Hamming numbers (5-smooth): only prime factors 2, 3 and 5 }
function IsHamming(n: Integer): Boolean;
begin
  while n mod 2 = 0 do n := n div 2;
  while n mod 3 = 0 do n := n div 3;
  while n mod 5 = 0 do n := n div 5;
  IsHamming := n = 1;
end;

var
  n, count: Integer;
begin
  count := 0;
  n := 1;
  while count < 20 do
  begin
    if IsHamming(n) then
    begin
      Write(n, ' ');
      Inc(count);
    end;
    Inc(n);
  end;
  WriteLn;
end.
