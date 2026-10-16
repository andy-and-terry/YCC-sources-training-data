{$mode objfpc}{$H+}
program DivByZeroExceptionDemo;

uses SysUtils;

function SafeDiv(a, b: Integer): Integer;
begin
  try
    Result := a div b;
  except
    on EDivByZero do
    begin
      WriteLn('division by zero avoided');
      Result := 0;
    end;
  end;
end;

var
  z: Integer;
begin
  z := 0;
  WriteLn(SafeDiv(10, 2));
  WriteLn(SafeDiv(10, z));
end.
