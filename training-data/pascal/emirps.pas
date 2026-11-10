program Emirps;

function IsPrime(n: LongInt): Boolean;
var i: LongInt;
begin
  IsPrime := n >= 2;
  i := 2;
  while IsPrime and (i * i <= n) do
  begin
    if n mod i = 0 then IsPrime := False;
    Inc(i);
  end;
end;

function Reverse(n: LongInt): LongInt;
begin
  Reverse := 0;
  while n > 0 do
  begin
    Reverse := Reverse * 10 + n mod 10;
    n := n div 10;
  end;
end;

var n, r, count: LongInt;
begin
  count := 0;
  n := 2;
  while count < 10 do
  begin
    r := Reverse(n);
    if (r <> n) and IsPrime(n) and IsPrime(r) then
    begin
      Write(n, ' ');
      Inc(count);
    end;
    Inc(n);
  end;
  WriteLn; { 13 17 31 37 71 73 79 97 107 113 }
end.
