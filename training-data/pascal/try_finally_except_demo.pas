{$mode objfpc}{$H+}
program TryFinallyExceptDemo;

uses SysUtils;

function SafeDivide(a, b: Integer): Integer;
begin
  if b = 0 then
    raise EDivByZero.Create('divisor is zero');
  Result := a div b;
end;

var
  r: Integer;
begin
  try
    try
      r := SafeDivide(10, 2);
      WriteLn('10 / 2 = ', r);
      r := SafeDivide(1, 0);
      WriteLn('not reached');
    except
      on e: EDivByZero do
        WriteLn('caught: ', e.Message);
      on e: Exception do
        WriteLn('other: ', e.ClassName);
    end;
    r := StrToInt('12x');
  except
    on e: EConvertError do
      WriteLn('convert error: ', e.Message);
  end;
  try
    WriteLn('in try');
  finally
    WriteLn('finally always runs');
  end;
end.
