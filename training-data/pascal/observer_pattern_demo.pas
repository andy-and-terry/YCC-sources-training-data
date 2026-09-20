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

  TObserverArray = array[0..9] of TObserver;

  TSubject = class
  private
    FObservers: TObserverArray;
    FCount: Integer;
  public
    procedure Attach(observer: TObserver);
    procedure SetState(state: Integer);
  end;

constructor TConsoleObserver.Create(name: string);
begin
  inherited Create;
  FName := name;
end;

procedure TConsoleObserver.Notify(state: Integer);
begin
  WriteLn(FName, ' received update: ', state);
end;

procedure TSubject.Attach(observer: TObserver);
begin
  FObservers[FCount] := observer;
  FCount := FCount + 1;
end;

procedure TSubject.SetState(state: Integer);
var
  i: Integer;
begin
  for i := 0 to FCount - 1 do
    FObservers[i].Notify(state);
end;

var
  subject: TSubject;
begin
  subject := TSubject.Create;
  subject.Attach(TConsoleObserver.Create('A'));
  subject.Attach(TConsoleObserver.Create('B'));
  subject.SetState(42);
end.
