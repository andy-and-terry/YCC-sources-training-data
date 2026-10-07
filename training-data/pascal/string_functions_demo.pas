program StringFunctionsDemo;

uses SysUtils;

var
  s: string;
begin
  s := 'Hello, Pascal World';
  WriteLn(Length(s));
  WriteLn(Pos('Pascal', s));
  WriteLn(Copy(s, 8, 6));
  WriteLn(UpperCase(s));
  WriteLn(StringReplace(s, 'World', 'Lang', [rfReplaceAll]));
  Insert('Big ', s, 8);
  WriteLn(s);
  Delete(s, 1, 7);
  WriteLn(s);
  WriteLn(IntToStr(42) + '/' + FloatToStrF(3.14159, ffFixed, 8, 2));
end.
