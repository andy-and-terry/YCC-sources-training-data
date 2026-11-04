program InterleaveStrings;

function Interleave(const a, b: string): string;
var i, n: Integer;
begin
  Result := '';
  n := Length(a);
  if Length(b) > n then n := Length(b);
  for i := 1 to n do
  begin
    if i <= Length(a) then Result := Result + a[i];
    if i <= Length(b) then Result := Result + b[i];
  end;
end;

begin
  WriteLn(Interleave('abc', '12345'));
  WriteLn(Interleave('abcdef', 'XY'));
end.
