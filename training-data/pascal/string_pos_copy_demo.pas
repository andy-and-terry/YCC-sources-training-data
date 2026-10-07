program StringPosCopyDemo;

var
  s, part: string;
  p: Integer;
begin
  s := 'key=value=more';
  p := Pos('=', s);
  WriteLn('first = at ', p);
  WriteLn('key: ', Copy(s, 1, p - 1));
  part := Copy(s, p + 1, Length(s));
  WriteLn('rest: ', part);

  Delete(s, 1, p);
  WriteLn('after delete: ', s);
  Insert('NEW-', s, 1);
  WriteLn('after insert: ', s);

  WriteLn(UpCase('a'), ' ', Length(s));
  WriteLn(StringOfChar('-', 10));
end.
