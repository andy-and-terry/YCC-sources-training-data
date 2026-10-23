program StrUtilsPosExDemo;

{$mode objfpc}{$H+}

uses
  SysUtils, StrUtils;

var
  s: string;
  p, count: Integer;

begin
  s := 'the cat and the hat and the bat';

  { PosEx finds the next match starting at a given index }
  count := 0;
  p := PosEx('the', s, 1);
  while p > 0 do
  begin
    Inc(count);
    WriteLn('match at ', p);
    p := PosEx('the', s, p + 1);
  end;
  WriteLn('total matches: ', count);

  WriteLn(ReverseString('pascal'));
  WriteLn(DupeString('ab', 3));
  WriteLn(AnsiReplaceStr(s, 'and', '&'));
  WriteLn(PadLeft('7', 3));
  WriteLn(IfThen(count > 2, 'many', 'few'));
  WriteLn(StartsText('THE', s), ' ', EndsText('BAT', s));
end.
