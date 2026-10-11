program StringInsertDeleteDemo;

var
  s: string;
begin
  s := 'Hello World';
  Insert('Big ', s, 7);
  WriteLn(s);

  Delete(s, 7, 4);
  WriteLn(s);

  Delete(s, 6, 6);
  WriteLn(s, '|');

  s := s + ', Pascal';
  WriteLn(s, ' (length ', Length(s), ')');

  SetLength(s, 5);
  WriteLn(s);
  s[1] := 'J';
  WriteLn(s);
  WriteLn(StringOfChar('-', 10));
end.
