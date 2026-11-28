program Fletcher16Checksum;
var
  s: string = 'abcde';
  s1, s2, i: Integer;
begin
  s1 := 0;
  s2 := 0;
  for i := 1 to Length(s) do
  begin
    s1 := (s1 + Ord(s[i])) mod 255;
    s2 := (s2 + s1) mod 255;
  end;
  WriteLn(LowerCase(IntToHex((s2 shl 8) or s1, 4)));
end.
