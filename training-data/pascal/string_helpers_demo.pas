program StringHelpersDemo;

uses SysUtils;

var
  s: string;
begin
  s := '  Pascal Rocks  ';
  WriteLn('[', Trim(s), ']');
  WriteLn(UpperCase(s));
  WriteLn(LowerCase(Trim(s)));
  WriteLn(Pos('Rocks', s));
  WriteLn(Copy(Trim(s), 1, 6));
  WriteLn(StringReplace(s, 'Rocks', 'Rules', []));
  WriteLn(IntToStr(42) + '!', ' ', StrToInt('8') + 1);
end.
