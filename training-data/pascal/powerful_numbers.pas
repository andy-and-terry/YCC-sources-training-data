program PowerfulNumbers;

function IsPowerful(n: Integer): Boolean;
var
  p: Integer;
begin
  IsPowerful := False;
  p := 2;
  while p * p <= n do
  begin
    if n mod p = 0 then
    begin
      if n mod (p * p) <> 0 then Exit;
      while n mod p = 0 do
        n := n div p;
    end;
    Inc(p);
  end;
  IsPowerful := n = 1;
end;

var
  n: Integer;
begin
  for n := 1 to 100 do
    if IsPowerful(n) then Write(n, ' ');
  WriteLn;
end.
