{ Primorials up to 1e6, including 1; expect 8. }
program PrimorialNumbers;

var c, p: Integer; acc: Int64;

function IsPrime(n: Integer): Boolean;
var d: Integer;
begin
  IsPrime := n >= 2;
  d := 2;
  while IsPrime and (d * d <= n) do
  begin
    if n mod d = 0 then IsPrime := False;
    Inc(d);
  end;
end;

begin
  acc := 1; c := 1; p := 2;
  WriteLn(acc);
  while True do
  begin
    if IsPrime(p) then
    begin
      acc := acc * p;
      if acc > 1000000 then Break;
      Inc(c);
      WriteLn(acc);
    end;
    Inc(p);
  end;
  WriteLn('count: ', c);
end.
