{$mode objfpc}
program ObserverPatternDemo;

type
  TObserver = class
  public
    procedure Notify(state: Integer); virtual; abstract;
  end;

  TConsoleObserver = class(TObserver)
  private
    FName: string;
  public
    constructor Create(name: string);
    procedure Notify(state: Integer); override;
  end;

  TSubject = class
  private
    FObservers: array[0..9] of TObserver;
    FObserverCount: Integer;
    FState: Integer;
  public
    constructor Create;
    procedure Attach(observer: TObserver);
    procedure SetState(state: Integer);
  end;

constructor TConsoleObserver.Create(name: string);
begin
  FName := name;
end;

procedure TConsoleObserver.Notify(state: Integer);
begin
  WriteLn(FName, ' received update: ', state);
end;

constructor TSubject.Create;
begin
  FObserverCount := 0;
  FState := 0;
end;

procedure TSubject.Attach(observer: TObserver);
begin
  FObservers[FObserverCount] := observer;
  FObserverCount := FObserverCount + 1;
end;

procedure TSubject.SetState(state: Integer);
var
  i: Integer;
begin
  FState := state;
  for i := 0 to FObserverCount - 1 do
    FObservers[i].Notify(FState);
end;

var
  subject: TSubject;

begin
  subject := TSubject.Create;
  subject.Attach(TConsoleObserver.Create('A'));
  subject.Attach(TConsoleObserver.Create('B'));
  subject.SetState(42);
end.
