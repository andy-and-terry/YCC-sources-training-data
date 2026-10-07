{$mode objfpc}
program SingletonPatternDemo;

type
  TLogger = class
  private
    FMessages: array[0..99] of string;
    FCount: Integer;
    constructor Create;
  public
    class function Instance: TLogger;
    procedure Log(msg: string);
    procedure PrintAll;
  end;

var
  GlobalInstance: TLogger = nil;

constructor TLogger.Create;
begin
  FCount := 0;
end;

class function TLogger.Instance: TLogger;
begin
  if GlobalInstance = nil then
    GlobalInstance := TLogger.Create;
  Instance := GlobalInstance;
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
  logger1 := TLogger.Instance;
  logger1.Log('first message');
  logger2 := TLogger.Instance;
  logger2.Log('second message');
  WriteLn(logger1 = logger2);
  logger1.PrintAll;
end.
