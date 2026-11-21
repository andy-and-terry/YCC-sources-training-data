program DisariumNumbers;
{ Disarium numbers: digits raised to their 1-based positions sum to n. }
var
  n: Integer;

function IsDisarium(n: Integer): Boolean;
var
  s: string;
  i, j, d, p, total: Integer;
begin
  Str(n, s);
  total := 0;
  for i := 1 to Length(s) do
  begin
    d := Ord(s[i]) - Ord('0');
    p := 1;
    for j := 1 to i do p := p * d;
    total := total + p;
  end;
  IsDisarium := total = n;
end;

begin
  for n := 1 to 999 do
    if IsDisarium(n) then Write(n, ' ');
  WriteLn;
end.
