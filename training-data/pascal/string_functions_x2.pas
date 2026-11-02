program StringFunctionsX2;
uses SysUtils;
var s: string;
begin
  s := 'Hello, Pascal';
  writeln(UpperCase(s), ' ', Length(s), ' ', Pos('Pas', s));
  writeln(Copy(s, 8, 6));
end.
