program TryFinallyExceptDemo;

{$mode objfpc}{$H+}

uses SysUtils;

function SafeDiv(a, b: Integer): Integer;
begin
  try
    Result := a div b;
  except
    on EDivByZero do
    begin
      WriteLn('divide by zero, returning 0');
      Result := 0;
    end;
  end;
end;

var
  n: Integer;
begin
  WriteLn(SafeDiv(10, 2));
  WriteLn(SafeDiv(1, 0));
  try
    try
      n := StrToInt('12x');
    except
      on E: EConvertError do
        WriteLn('bad number: ', E.Message);
    end;
  finally
    WriteLn('cleanup done');
  end;
end.
