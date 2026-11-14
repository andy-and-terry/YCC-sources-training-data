program Strs;
uses SysUtils;
var s: string;
begin
  s := 'Hello, World';
  writeln(UpperCase(s), ' ', Length(s), ' ', Pos('World', s));
  writeln(Copy(s, 1, 5), ' ', StringReplace(s, 'l', 'L', [rfReplaceAll]));
end.
