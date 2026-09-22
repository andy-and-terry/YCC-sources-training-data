{$mode objfpc}
program ObserverPatternDemo;

type
  TObserver = class
  public
    procedure Notify(price: Double); virtual; abstract;
  end;

  TLogger = class(TObserver)
  public
    procedure Notify(price: Double); override;
  end;

  TAlert = class(TObserver)
  private
    FThreshold: Double;
  public
    constructor Create(threshold: Double);
    procedure Notify(price: Double); override;
  end;

  TTicker = class
  private
    FObservers: array[0..9] of TObserver;
    FCount: Integer;
    FPrice: Double;
  public
    constructor Create;
    procedure Attach(observer: TObserver);
    procedure SetPrice(price: Double);
  end;

procedure TLogger.Notify(price: Double);
begin
  WriteLn('logger: price is now ', price: 0: 2);
end;

constructor TAlert.Create(threshold: Double);
begin
  FThreshold := threshold;
end;

procedure TAlert.Notify(price: Double);
begin
  if price > FThreshold then
    WriteLn('alert: price crossed threshold at ', price: 0: 2);
end;

constructor TTicker.Create;
begin
  FCount := 0;
end;

procedure TTicker.Attach(observer: TObserver);
begin
  FObservers[FCount] := observer;
  FCount := FCount + 1;
end;

procedure TTicker.SetPrice(price: Double);
var
  i: Integer;
begin
  FPrice := price;
  for i := 0 to FCount - 1 do
    FObservers[i].Notify(FPrice);
end;

var
  ticker: TTicker;
begin
  ticker := TTicker.Create;
  ticker.Attach(TLogger.Create);
  ticker.Attach(TAlert.Create(100.0));
  ticker.SetPrice(95.0);
  ticker.SetPrice(105.0);
end.
