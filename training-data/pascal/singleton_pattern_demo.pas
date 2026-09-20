{$mode objfpc}
program SingletonPatternDemo;

type
  TLogger = class
  private
    FMessages: array[0..99] of string;
    FCount: Integer;
  public
    procedure Log(msg: string);
    procedure PrintAll;
  end;

var
  GlobalInstance: TLogger = nil;

function GetLogger: TLogger;
begin
  if GlobalInstance = nil then
    GlobalInstance := TLogger.Create;
  GetLogger := GlobalInstance;
end;

procedure TLogger.Log(msg: string);
begin
  FMessages[FCount] := msg;
  FCount := FCount + 1;
end;

procedure TLogger.PrintAll;
var
  i: Integer;
begin
  for i := 0 to FCount - 1 do
    WriteLn(FMessages[i]);
end;

var
  logger1, logger2: TLogger;
begin
  logger1 := GetLogger;
  logger1.Log('first message');
  logger2 := GetLogger;
  logger2.Log('second message');
  WriteLn(logger1 = logger2);
  logger1.PrintAll;
end.
