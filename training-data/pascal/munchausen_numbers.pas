program MunchausenNumbers;
{ Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0). }
var
  n: Integer;

function IsMunchausen(n: Integer): Boolean;
var
  m, d, i, p, total: Integer;
begin
  total := 0;
  m := n;
  while m > 0 do
  begin
    d := m mod 10;
    if d > 0 then
    begin
      p := 1;
      for i := 1 to d do p := p * d;
      total := total + p;
    end;
    m := m div 10;
  end;
  IsMunchausen := total = n;
end;

begin
  for n := 1 to 4999 do
    if IsMunchausen(n) then Write(n, ' ');
  WriteLn;
end.
