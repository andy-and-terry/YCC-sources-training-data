program ExceptionTryFinallyX2;
uses SysUtils;
begin
  try
    try
      writeln(10 div StrToInt('0'));
    except
      on E: EDivByZero do writeln('div by zero');
    end;
  finally
    writeln('cleanup');
  end;
end.
