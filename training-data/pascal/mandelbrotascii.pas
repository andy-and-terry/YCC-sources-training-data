program MandelbrotAscii;
var xi, yi, n: integer; zr, zi, t, cr, ci: double; line: string;
begin
  for yi := -5 to 5 do
  begin
    line := '';
    for xi := -40 to 12 do
    begin
      cr := xi / 20; ci := yi / 5; zr := 0; zi := 0; n := 0;
      while (n < 30) and (zr * zr + zi * zi < 4) do
      begin
        t := zr * zr - zi * zi + cr;
        zi := 2 * zr * zi + ci;
        zr := t;
        Inc(n);
      end;
      if n = 30 then line := line + '#' else line := line + '.';
    end;
    WriteLn(line);
  end;
end.
