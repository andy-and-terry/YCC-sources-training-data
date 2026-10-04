program ExceptionTryFinallyDemo;

uses SysUtils;

function SafeDivide(a, b: Integer): Integer;
begin
  try
    Result := a div b;
  except
    on E: EDivByZero do
    begin
      WriteLn('caught: ', E.Message);
      Result := 0;
    end;
  end;
end;

begin
  WriteLn(SafeDivide(10, 2));
  WriteLn(SafeDivide(1, 0));
  try
    try
      raise Exception.Create('boom');
    finally
      WriteLn('cleanup runs');
    end;
  except
    on E: Exception do WriteLn('handled: ', E.Message);
  end;
end.
