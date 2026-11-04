program ZigzagConvert;
var
  s, res: string;

function Zigzag(const s: string; rows: Integer): string;
var
  lines: array of string;
  i, r, step: Integer;
begin
  if (rows = 1) or (rows >= Length(s)) then Exit(s);
  SetLength(lines, rows);
  r := 0; step := 1;
  for i := 1 to Length(s) do
  begin
    lines[r] := lines[r] + s[i];
    if r = 0 then step := 1
    else if r = rows - 1 then step := -1;
    r := r + step;
  end;
  Result := '';
  for i := 0 to rows - 1 do Result := Result + lines[i];
end;

begin
  s := 'PAYPALISHIRING';
  res := Zigzag(s, 3);
  WriteLn(res);
end.
