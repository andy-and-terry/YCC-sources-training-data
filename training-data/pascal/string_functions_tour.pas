program StringFunctionsTour;
var s: string;
begin
  s := 'Hello, Pascal';
  WriteLn(Length(s), ' ', UpCase(s[1]), ' ', Pos('Pascal', s));
  WriteLn(Copy(s, 1, 5));
  Delete(s, 1, 7);
  WriteLn(s);
end.
