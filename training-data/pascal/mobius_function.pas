program MobiusFunction;
{ Moebius function: 0 if n has a squared prime factor, else (-1)^k. }

function Mobius(n: Integer): Integer;
var
  result, p: Integer;
begin
  result := 1;
  p := 2;
  while p * p <= n do
  begin
    if n mod p = 0 then
    begin
      n := n div p;
      if n mod p = 0 then
      begin
        Mobius := 0;
        Exit;
      end;
      result := -result;
    end;
    Inc(p);
  end;
  if n > 1 then result := -result;
  Mobius := result;
end;

var
  i: Integer;
begin
  for i := 1 to 30 do Write(Mobius(i), ' ');
  WriteLn;
end.
