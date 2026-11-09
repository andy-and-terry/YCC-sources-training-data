program ExceptionTryFinally;
{$mode objfpc}
uses SysUtils;
begin
  try
    try
      raise Exception.Create('boom');
    except
      on E: Exception do WriteLn('caught: ', E.Message);
    end;
  finally
    WriteLn('cleanup');
  end;
end.
