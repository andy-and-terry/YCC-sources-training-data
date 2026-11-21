program BouncyNumbers;
{ Count bouncy numbers (neither increasing nor decreasing digits) below 1000. }
var
  n, count: Integer;

function IsBouncy(n: Integer): Boolean;
var
  m, prev, d: Integer;
  inc, dec: Boolean;
begin
  inc := True;
  dec := True;
  prev := n mod 10;
  m := n div 10;
  while m > 0 do
  begin
    d := m mod 10;
    if d > prev then inc := False;
    if d < prev then dec := False;
    prev := d;
    m := m div 10;
  end;
  IsBouncy := (not inc) and (not dec);
end;

begin
  count := 0;
  for n := 1 to 999 do
    if IsBouncy(n) then Inc(count);
  WriteLn(count);
end.
