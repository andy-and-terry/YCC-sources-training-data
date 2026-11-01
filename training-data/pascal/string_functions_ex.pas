program StringFunctionsEx;
uses SysUtils;
var S: string;
begin
  S := 'Hello, Pascal';
  WriteLn(UpperCase(S), ' ', Length(S));
  WriteLn(Copy(S, 8, 6), ' ', Pos('Pas', S));
  WriteLn(StringReplace(S, 'l', 'L', [rfReplaceAll]));
  WriteLn(Format('%5d|%-6s|%.2f', [42, 'ab', 3.14159]));
end.
