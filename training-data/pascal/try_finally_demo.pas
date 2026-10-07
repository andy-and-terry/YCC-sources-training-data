program TryFinallyDemo;

uses SysUtils;

procedure Risky(n: Integer);
begin
  try
    WriteLn('start ', n);
    if n = 0 then
      raise Exception.Create('zero not allowed');
    WriteLn(100 div n);
  finally
    WriteLn('cleanup ', n);
  end;
end;

begin
  Risky(5);
  try
    Risky(0);
  except
    on E: Exception do
      WriteLn('caught: ', E.Message);
  end;
end.
