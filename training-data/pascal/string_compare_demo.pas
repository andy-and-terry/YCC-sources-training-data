program StringCompareDemo;

uses SysUtils;

var
  a, b: string;
begin
  a := 'apple';
  b := 'Apple';
  WriteLn('a = b: ', a = b);
  WriteLn('a < b: ', a < b);
  WriteLn('a > b: ', a > b);
  WriteLn('CompareStr: ', CompareStr(a, b));
  WriteLn('CompareText: ', CompareText(a, b));
  WriteLn('SameText: ', SameText(a, b));
  WriteLn('LowerCase: ', LowerCase('MiXeD'));
  WriteLn('UpperCase: ', UpperCase('MiXeD'));
  WriteLn('prefix check: ', Copy('unhappy', 1, 2) = 'un');
end.
