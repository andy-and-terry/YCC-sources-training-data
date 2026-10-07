program CustomExceptionDemo;

uses SysUtils;

type
  EInsufficientFunds = class(Exception)
    Needed: Integer;
    constructor CreateNeeded(ANeeded: Integer);
  end;

constructor EInsufficientFunds.CreateNeeded(ANeeded: Integer);
begin
  inherited CreateFmt('need %d more', [ANeeded]);
  Needed := ANeeded;
end;

procedure Withdraw(balance, amount: Integer);
begin
  if amount > balance then
    raise EInsufficientFunds.CreateNeeded(amount - balance);
  WriteLn('ok, left ', balance - amount);
end;

begin
  Withdraw(100, 30);
  try
    Withdraw(50, 80);
  except
    on E: EInsufficientFunds do
      WriteLn(E.Message, ' (', E.Needed, ')');
  end;
end.
