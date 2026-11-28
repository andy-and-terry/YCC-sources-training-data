program RailFenceCipher;

const
  K = 3;
  Cycle = 4;

function Rail(i: Integer): Integer;
begin
  Result := i mod Cycle;
  if Result >= K then Result := Cycle - Result;
end;

var
  text, outStr: string;
  r, i: Integer;
begin
  text := 'WEAREDISCOVERED';
  outStr := '';
  for r := 0 to K - 1 do
    for i := 0 to Length(text) - 1 do
      if Rail(i) = r then outStr := outStr + text[i + 1];
  WriteLn(outStr);
end.
