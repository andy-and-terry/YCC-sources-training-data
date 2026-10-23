program ParamStrArgsDemo;

{$mode objfpc}{$H+}

uses
  SysUtils;

var
  i: Integer;
  verbose: Boolean;
  total: Integer;

begin
  { ParamStr(0) is the program name, ParamCount excludes it }
  WriteLn('program: ', ExtractFileName(ParamStr(0)));
  WriteLn('argument count: ', ParamCount);

  verbose := False;
  total := 0;
  for i := 1 to ParamCount do
  begin
    if ParamStr(i) = '-v' then
      verbose := True
    else
      total := total + StrToIntDef(ParamStr(i), 0);
  end;

  if verbose then
    WriteLn('verbose mode on');
  WriteLn('sum of numeric arguments: ', total);

  { exit code reported to the shell }
  if ParamCount = 0 then
    Halt(1);
end.
