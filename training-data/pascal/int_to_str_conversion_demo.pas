program IntToStrConversionDemo;

uses SysUtils;

var
  n, code: Integer;
  s: string;
begin
  s := IntToStr(2024) + '!';
  WriteLn(s);
  WriteLn(StrToInt('123') + 1);
  WriteLn(StrToIntDef('oops', -1));
  WriteLn(FloatToStr(3.5));
  WriteLn(StrToFloat('2.25') * 2:0:2);
  WriteLn(IntToHex(255, 4));
  WriteLn(StrToInt('$FF'));

  Val('77x', n, code);
  WriteLn('code: ', code);
  Val('77', n, code);
  WriteLn('n=', n, ' code=', code);

  try
    n := StrToInt('abc');
  except
    on E: EConvertError do WriteLn('caught: ', E.Message);
  end;
end.
