{$mode objfpc}{$H+}
program ClassStaticCounterDemo;

type
  TTicket = class
  private
    class var FNext: Integer;
  public
    Id: Integer;
    constructor Create;
    class function Issued: Integer;
  end;

constructor TTicket.Create;
begin
  Inc(FNext);
  Id := FNext;
end;

class function TTicket.Issued: Integer;
begin
  Result := FNext;
end;

var
  a, b, c: TTicket;
begin
  a := TTicket.Create;
  b := TTicket.Create;
  c := TTicket.Create;
  WriteLn('ids: ', a.Id, ' ', b.Id, ' ', c.Id);
  WriteLn('issued: ', TTicket.Issued);
  a.Free; b.Free; c.Free;
end.
