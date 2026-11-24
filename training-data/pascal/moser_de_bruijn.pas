program MoserDeBruijn;
{ Moser-de Bruijn sequence: binary digits of n read in base 4. }

function Moser(n: Integer): Integer;
var
  result, place: Integer;
begin
  result := 0;
  place := 1;
  while n > 0 do
  begin
    if (n and 1) = 1 then result := result + place;
    n := n shr 1;
    place := place * 4;
  end;
  Moser := result;
end;

var
  n: Integer;
begin
  for n := 0 to 11 do Write(Moser(n), ' ');
  WriteLn;
end.
