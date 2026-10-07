{$mode objfpc}{$H+}
program StringTokenizeDemo;

uses SysUtils;

var
  line, token: string;
  p: Integer;
  n: Integer = 0;
begin
  line := 'alpha,beta,,gamma,delta';
  while line <> '' do
  begin
    p := Pos(',', line);
    if p = 0 then
    begin
      token := line;
      line := '';
    end
    else
    begin
      token := Copy(line, 1, p - 1);
      Delete(line, 1, p);
    end;
    Inc(n);
    WriteLn(n, ': "', token, '"');
  end;
  line := '  padded text  ';
  WriteLn('[', Trim(line), ']');
  Insert('very ', line, 3);
  WriteLn('[', line, ']');
  WriteLn(StringReplace('a-b-c', '-', '+', [rfReplaceAll]));
  WriteLn(Length('hello'), ' ', UpCase('x'), ' ', Ord('A'), ' ', Chr(66));
end.
