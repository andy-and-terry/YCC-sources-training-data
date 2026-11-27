program RailFenceCipher;
const
  Text = 'WEAREDISCOVERED';
  Rails = 3;
var
  row, i, r, step: Integer;
  res: string;
begin
  res := '';
  for row := 0 to Rails - 1 do
  begin
    r := 0;
    step := 1;
    for i := 1 to Length(Text) do
    begin
      if r = row then res := res + Text[i];
      if r = 0 then step := 1
      else if r = Rails - 1 then step := -1;
      r := r + step;
    end;
  end;
  WriteLn(res);
end.
