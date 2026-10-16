{$mode objfpc}{$H+}
program ExceptionRaiseReraiseDemo;

uses SysUtils;

procedure Inner;
begin
  raise Exception.Create('inner failure');
end;

procedure Middle;
begin
  try
    Inner;
  except
    on E: Exception do
    begin
      WriteLn('middle saw: ', E.Message);
      raise;
    end;
  end;
end;

begin
  try
    Middle;
  except
    on E: Exception do
      WriteLn('outer saw: ', E.Message);
  end;

  try
    raise EInvalidOp.CreateFmt('bad op %d', [42]);
  except
    on E: EInvalidOp do WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
