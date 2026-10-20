{$mode objfpc}{$H+}
program ClassesPropertiesVirtual;

type
  TAccount = class
  private
    FBalance: Currency;
    procedure SetBalance(V: Currency);
  public
    constructor Create(Initial: Currency);
    destructor Destroy; override;
    procedure Deposit(Amt: Currency); virtual;
    property Balance: Currency read FBalance write SetBalance;
  end;

  TSavings = class(TAccount)
    procedure Deposit(Amt: Currency); override;
  end;

constructor TAccount.Create(Initial: Currency);
begin inherited Create; FBalance := Initial; end;

destructor TAccount.Destroy;
begin WriteLn('destroyed ', FBalance:0:2); inherited; end;

procedure TAccount.SetBalance(V: Currency);
begin if V < 0 then raise Exception.Create('negative') else FBalance := V; end;

procedure TAccount.Deposit(Amt: Currency);
begin Balance := Balance + Amt; end;

procedure TSavings.Deposit(Amt: Currency);
begin inherited Deposit(Amt * 1.01); end;

var A: TAccount;
begin
  A := TSavings.Create(100);
  try
    A.Deposit(100);
    WriteLn(A.Balance:0:2);
    try A.Balance := -5; except on E: Exception do WriteLn('error: ', E.Message); end;
  finally
    A.Free;
  end;
end.
