program AffineCipher;

var
  msg, outStr: string;
  i, x: Integer;
begin
  msg := 'AFFINE';
  outStr := '';
  for i := 1 to Length(msg) do
  begin
    x := Ord(msg[i]) - Ord('A');
    outStr := outStr + Chr((5 * x + 8) mod 26 + Ord('A'));
  end;
  WriteLn(outStr);
end.
