program TryFinallyExceptOn;
{$mode objfpc}
uses SysUtils;
var
  N: Integer;
begin
  try
    try
      N := StrToInt('abc');
    except
      on E: EConvertError do WriteLn('convert error');
    end;
  finally
    WriteLn('finally runs');
  end;
end.
