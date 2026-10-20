{$mode objfpc}{$H+}
program StringFunctionsSysUtils;

uses SysUtils, StrUtils;

var
  S: string;
begin
  S := 'Hello, World';
  WriteLn(Length(S), ' ', UpperCase(S), ' ', LowerCase(S), ' ', Copy(S, 8, 5), ' ', Pos('World', S));
  WriteLn(StringReplace(S, 'l', 'L', [rfReplaceAll]), ' ', Trim('  pad  '), '|', ReverseString(S));
  WriteLn(IntToStr(42) + StrToIntDef('x', -1).ToString + FloatToStr(2.5), ' ', Format('%5.2f|%-5s|%3d|%x', [3.14159, 'ab', 7, 255]));
  WriteLn(StrToInt('123') + 1, ' ', StrToFloat('1.5') * 2:0:1, ' ', SameText('ABC', 'abc'), ' ', CompareStr('a', 'b'));
  WriteLn(IntToHex(255, 4), ' ', Chr(65), Ord('a'), ' ', UpCase('q'), ' ', DupeString('ab', 3));
  WriteLn(ExtractFileName('/a/b/c.txt'), ' ', ExtractFileExt('x.tar.gz'), ' ', ChangeFileExt('a.txt', '.md'));
  WriteLn(WordCount('the quick fox', [' ']), ' ', ExtractWord(2, 'the quick fox', [' ']), ' ', PadLeft('7', 3));
  Delete(S, 1, 7); Insert('Big ', S, 1);
  WriteLn(S);
end.
