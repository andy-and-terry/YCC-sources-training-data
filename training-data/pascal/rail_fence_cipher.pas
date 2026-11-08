program RailFence;
var
  s: string;
  rows: array[0..2] of string;
  i, r, dir: integer;
begin
  s := 'WEAREDISCOVERED';
  r := 0; dir := 1;
  for i := 1 to Length(s) do
  begin
    rows[r] := rows[r] + s[i];
    if r = 0 then dir := 1;
    if r = 2 then dir := -1;
    r := r + dir;
  end;
  writeln(rows[0] + rows[1] + rows[2]);
end.
