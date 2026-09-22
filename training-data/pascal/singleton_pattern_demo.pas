{$mode objfpc}
program SingletonPatternDemo;

type
  TLogger = class
  private
    FMessages: array[0..9] of string;
    FCount: Integer;
  public
    constructor Create;
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

constructor TLogger.Create;
begin
  FCount := 0;
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
  WriteLn('same instance: ', logger1 = logger2);
  logger1.PrintAll;
end.
