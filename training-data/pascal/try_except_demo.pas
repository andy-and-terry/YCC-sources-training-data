program TryExceptDemo;

{$mode objfpc}{$H+}

uses
  SysUtils;

function SafeDivide(a, b: Integer): Integer;
begin
  Result := a div b;
end;

begin
  try
    WriteLn(SafeDivide(10, 2));
    WriteLn(SafeDivide(1, 0));
  except
    on E: EDivByZero do
      WriteLn('Caught: division by zero');
    on E: Exception do
      WriteLn('Other: ', E.Message);
  end;

  try
    WriteLn(StrToInt('abc'));
  except
    on E: EConvertError do
      WriteLn('Convert error: ', E.Message);
  end;

  try
    raise Exception.Create('custom failure');
  finally
    WriteLn('cleanup runs');
  end;
end.
