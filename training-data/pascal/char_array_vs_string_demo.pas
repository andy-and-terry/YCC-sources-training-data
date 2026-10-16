program CharArrayVsStringDemo;

var
  buf: array[0..9] of Char;
  s: string;
  i: Integer;
begin
  for i := 0 to 9 do
    buf[i] := Chr(Ord('A') + i);
  buf[9] := #0;

  s := PChar(@buf[0]);
  WriteLn(s, ' length=', Length(s));

  s := 'short';
  FillChar(buf, SizeOf(buf), 0);
  Move(s[1], buf[0], Length(s));
  WriteLn(PChar(@buf[0]));
  WriteLn('first byte: ', Ord(buf[0]));
  WriteLn('high index: ', High(buf));
end.
