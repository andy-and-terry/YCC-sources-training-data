program SphenicNumbers;

function IsSphenic(n: Integer): Boolean;
var
  p, distinct: Integer;
begin
  IsSphenic := False;
  distinct := 0;
  p := 2;
  while p * p <= n do
  begin
    if n mod p = 0 then
    begin
      n := n div p;
      if n mod p = 0 then Exit;
      Inc(distinct);
    end;
    Inc(p);
  end;
  if n > 1 then Inc(distinct);
  IsSphenic := distinct = 3;
end;

var
  n: Integer;
begin
  for n := 2 to 79 do
    if IsSphenic(n) then Write(n, ' ');
  WriteLn;
end.
