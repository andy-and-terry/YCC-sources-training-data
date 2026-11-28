program Exc;
{$mode objfpc}
uses SysUtils;
var n: Integer;
begin
  try
    try
      n := StrToInt('abc');
    except
      on E: EConvertError do writeln('bad number');
    end;
  finally
    writeln('done');
  end;
end.
